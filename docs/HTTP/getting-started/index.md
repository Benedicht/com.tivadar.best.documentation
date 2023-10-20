---
comments: true
---

# Getting Started

## Steps for sending a HTTP request

Here's a complete, working example that we will discuss in more detail in the following topics:
```cs hl_lines="11-12 15-17 20 29-33"
using Best.HTTP;
using Best.HTTP.Request.Upload.Forms;

using UnityEngine;

public sealed class HTTPTest : MonoBehaviour
{
    private void Start()
    {
        // 1. Create request with a callback
        var request = HTTPRequest.CreatePost("https://httpbin.org/post", 
                                             RequestFinishedCallback);

        // 2. Setup request parameters
        request.UploadSettings.UploadStream = new MultipartFormDataStream()
            .AddField("Field Name 1", "Field value 1")
            .AddField("Field Name 2", "Field value 2");

        // 3. Send request
        request.Send();
    }

    // 4. This callback is called when the request is finished. It might finished because of an error!
    private void RequestFinishedCallback(HTTPRequest req, HTTPResponse resp)
    {
        switch(req.State)
        {
            case HTTPRequestStates.Finished:
                if (resp.IsSuccess)
                {
                    // 5. Here we can process the server's response
                    Debug.Log("Upload finished succesfully!");
                }
                else
                {
                    // 6. Error handling
                    Debug.Log($"Server sent an error: {resp.StatusCode}-{resp.Message}");
                }
                break;

            default:
                // 6. Error handling
                Debug.LogError($"Request finished with error! Request state: {req.State}");
                break;
        }
    }
}
```

We can split a `HTTPRequest`'s lifetime into different sections.

### 1. Create request

Before we can send a HTTP request to the server, we have to create an [HTTPRequest](../api-reference/HTTP/HTTPRequest.md) object. 
Using one of the static functions gives us a quick way to create one and because the method of the request is in its name, it's more explicit about what kind of request we're creating:

=== "GET"
    `#!cs var request = HTTPRequest.CreateGet("https://example.com", callback);`
=== "POST"
    `#!cs var request = HTTPRequest.CreatePost("https://example.com/post", callback);`
=== "PUT"
    `#!cs var request = HTTPRequest.CreatePut("https://example.com/put", callback);`

Only the most used methods have a static function: `CreateGet`, `CreatePost`, `CreatePut`, for other methods one of the HTTPRequest constructor have to be used.
All static functions have a version callback-less version too.

Using constructors it would look like this:
=== "GET"
    `#!cs var request = new HTTPRequest("https://example.com", callback);`
=== "POST"
    `#!cs var request = new HTTPRequest("https://example.com/post", HTTPMethods.Post, callback);`
=== "PUT"
    `#!cs var request = new HTTPRequest("https://example.com/put", HTTPMethods.Put, callback);`

Deciding between constructors or static functions is just a matter of taste.

!!! tip "HTTPRequest supports all major HTTP methods: [GET, POST, PUT, DELETE, HEAD, PATCH, MERGE, OPTIONS, QUERY](../api-reference/HTTP/HTTPMethods.md)!"

### 2. Setup request

After the request is created, we can customize it: what we want to upload, add progress tracking, set other parameters.
In the example above we create a new `MultipartFormDataStream` to send a http-form with two text fields:
```cs
request.UploadSettings.UploadStream = new MultipartFormDataStream()
    .AddField("Field Name 1", "Field value 1")
    .AddField("Field Name 2", "Field value 2");
```

`MultipartFormDataStream` also supports streams as field values for memory efficient file uploads.

!!! Tip
    UploadStream can accept any regular Stream implementations too: `FileStream`, `MemoryStream`, etc, described in more detail under the [Uploading](uploads.md) topic.

### 3. Send

Processing a request starts only when its `#!cs Send()` function is called!

### 4. Wait for completion

When processing of a request starts, we have to wait for its outcome. The plugin supports all the three major ways to wait and get notified when a request finishes:

#### Callbacks
Here's again our example. 
In this example there's a `RequestFinishedCallback` method that we use as a callback when the request completes, 
we can do so by passing it to the `HTTPRequest.CreatePost` function's second parameter.
For one `HTTPRequest`, its callback is called exactly once, when the request completes and no further processing is done by the plugin.


```cs hl_lines="11-12 24 29-33"
using Best.HTTP;
using Best.HTTP.Request.Upload.Forms;

using UnityEngine;

public sealed class HTTPTest : MonoBehaviour
{
    private void Start()
    {
        // 1. Create request with a callback
        var request = HTTPRequest.CreatePost("https://httpbin.org/post", 
                                             RequestFinishedCallback);

        // 2. Setup request parameters
        request.UploadSettings.UploadStream = new MultipartFormDataStream()
            .AddField("Field Name 1", "Field value 1")
            .AddField("Field Name 2", "Field value 2");

        // 3. Send request
        request.Send();
    }

    // 4. This callback is called when the request is finished. It might finished because of an error!
    private void RequestFinishedCallback(HTTPRequest req, HTTPResponse resp)
    {
        switch(req.State)
        {
            case HTTPRequestStates.Finished:
                if (resp.IsSuccess)
                {
                    // 5. Here we can process the server's response
                    Debug.Log("Upload finished succesfully!");
                }
                else
                {
                    // 6. Error handling
                    Debug.LogError($"Server sent an error: {resp.StatusCode}-{resp.Message}");
                }
                break;

            // 6. Error handling
            default:
                Debug.LogError($"Request finished with error! Request state: {req.State}");
                break;
        }
    }
}
```

#### Unity coroutines

The `HTTPRequest` implements the `IEnumerator` interface to be able to use in a Unity coroutine. 
We can rewrite the example above to use a coroutine:
```cs hl_lines="13 16-18 21 24 30-33"
using System.Collections;

using Best.HTTP;
using Best.HTTP.Request.Upload.Forms;

using UnityEngine;

public sealed class HTTPTest : MonoBehaviour
{
    private IEnumerator Start()
    {
        // 1. Create request
        var request = HTTPRequest.CreatePost("https://httpbin.org/post");

        // 2. Setup
        request.UploadSettings.UploadStream = new MultipartFormDataStream()
            .AddField("Field Name 1", "Field value 1")
            .AddField("Field Name 2", "Field value 2");

        // 3. Send
        request.Send();

        // 4. Wait for completion
        yield return request;

        switch (request.State)
        {
            case HTTPRequestStates.Finished:
                // 5. Process response
                if (request.Response.IsSuccess)
                {
                    Debug.Log("Upload finished succesfully!");
                }
                else
                {
                    // 6. Error handling
                    Debug.LogError($"Server sent an error: {request.Response.StatusCode}-{request.Response.Message}");
                }
                break;

            // 6. Error handling
            default:
                Debug.LogError($"Request finished with error! Request state: {request.State}");
                break;
        }
    }
}
```

We can `yield return` the request object itself, it will continue the execution when the request completes.
!!! Note
    Notice that had to change the Start() function's signature from `#!cs void Start()` to `#!cs IEnumerator Start()`.
    This way the Unity runtime execute Start itself as a coroutine too.

#### Async-await

Here we have to change the `#!cs Start()` function's signature again to include `async`, so we can use await later at line 19:

```cs hl_lines="11 14-16 19 26"
using Best.HTTP;
using Best.HTTP.Request.Upload.Forms;

using UnityEngine;

public sealed class HTTPTest : MonoBehaviour
{
    private async void Start()
    {
        // 1. Create request
        var request = HTTPRequest.CreatePost("https://httpbin.org/post");

        // 2. Setup
        request.UploadSettings.UploadStream = new MultipartFormDataStream()
            .AddField("Field Name 1", "Field value 1")
            .AddField("Field Name 2", "Field value 2");

        try
        {
            // 3. Send & wait for completion
            var response = await request.GetHTTPResponseAsync();
            // 5. Process response
            if (response.IsSuccess)
                Debug.Log("Upload finished succesfully!");
            else
                Debug.LogError($"Server sent an error: {response.StatusCode}-{response.Message}");
        }
        catch (AsyncHTTPException e)
        {
            // 6. Error handling
            Debug.LogError($"Request finished with error! Error: {e.Message}");
        }
    }
}

```

The plugin also ships with the `GetAssetBundleAsync`, `GetAsStringAsync`, `GetAsTexture2DAsync`, `GetRawDataAsync` and `GetFromJsonResultAsync<T>` functions.

### 5. Process response

A request can be completed in various ways, it might be succesfully received a response from the server,
but it might be timeouted if connecting to the server took too much time. 
A request's `State` stores in what state the request is completed:

- `HTTPRequestStates.Finished` means, that it could succesfully download the server's response. 
!!! Warning
    Even if the request's State is HTTPRequestStates.Finished, the server might sent an error and the response's content isn't what we expect!
    By testing the response's `StatusCode` or checking `IsSuccess` we can make sure that all possibilities are handled.
- `HTTPRequestStates.Error`, `HTTPRequestStates.Aborted`, `HTTPRequestStates.ConnectionTimedOut`, `HTTPRequestStates.TimedOut`: these are all
indicate that the request failed for various reasons.

#### Ways to access downloaded data

For smaller resources the `HTTPResponse` class provides a few specialized properties: `#!cs byte[] Data`, `#!cs string DataAsText` and `#!cs Texture2D DataAsTexture2D`.
These can be used to access the downloaded data as raw bytes, converted to an utf-8 string or as a Unity Texture2D. 

For larger content, or where possible to process the content in chunks, I would recommend to use streaming using the `DownStream` property for a more memory-efficient alternative.
Streaming with `DownStream` is described in detail under the [Downloading](downloads.md) topic.

What considered *larger*, depends on a lot of factor. Mobile devices might have less resources than desktop ones, but even if the content is large, the API that will process it
might not have a version that can accept data coming in chunks. In that case we don't have too much options, have to allocate a large enough buffer...
The plugin however supports cache-only downloads (or if you want make sure your content can't be evicted from the cache, you can use streaming to write it into a file) and you can just open
a file-stream to use the resource.

### 6. Error handling

Networks are unreliable and servers can return with errors instead of the expected resource too: a request could fail for numerous reasons and can complete without receiving a valid response.
Hence, it's important to understand error handling, not just write a happy-path for the best case scenario, but be prepared for the worst case too.