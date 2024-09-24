---
comments: true
---

## Uploading

It's quite common that we want to send something to our server, it can be a new leaderboard entry, a GraphQL query, a still image or audio/video streams.
While they are all have common properties, they might need special care on the client side. How a server expects the uploaded data? Url-encoded, multipart/form-data, json text, raw bytes? It's easy to get lost.

The plugin supports the following ways to upload data:

| Upload method | What class to use |
|---------------|-------------------|
| [Raw bytes](#upload-raw-bytes)     | [System.IO.MemoryStream](https://learn.microsoft.com/en-us/dotnet/api/system.io.memorystream)      |
| [Raw file](#upload-a-file)      | [System.IO.FileStream](https://learn.microsoft.com/en-us/dotnet/api/system.io.filestream) |
| [`url-encoded` form](#upload-an-url-encoded-form) | `Best.HTTP.Request.Upload.Forms.UrlEncodedStream` |
| [`multipart/form-data`](#upload-an-multipartform-data-form) | `Best.HTTP.Request.Upload.Forms.MultipartFormDataStream` |
| [Json](#upload-an-object-as-json-text)          | `Best.HTTP.Request.Upload.JSonDataStream<T>` |
| [Data generated on-the-fly](#uploading-on-the-fly-generated-data) | `Best.HTTP.Request.Upload.DynamicUploadStream` |

The plugin's versatile `UploadStreamBase` class also makes it easy to add new ones.

!!! Tip "Plugin provided streams under the `Best.HTTP.Request.Upload` namespace always set the `"Content-Type"` header to the appropriate value, it's not advised to set them directly!"

### Upload Raw Bytes

This example uses MemoryStream to send pre-generated memory to the server.

```cs hl_lines="3-4"
var request = HTTPRequest.CreatePost("https://server/post", callback);

request.SetHeader("content-type", "application/octet-stream");
request.UploadSettings.UploadStream = new MemoryStream(data);

request.Send();
```

We can send textual data the same way, but we have to convert it first to raw bytes:

```cs hl_lines="5-8"
string strData = "...";

var request = HTTPRequest.CreatePost("https://server/post", callback);

request.SetHeader("content-type", "text/plain;charset=UTF-8");

var bytes = System.Text.Encoding.UTF8.GetBytes(strData);
request.UploadSettings.UploadStream = new MemoryStream(bytes);

request.Send();
```

### Upload a File

By using a `FileStream`, we can send even gigabytes sized files without allocating memory larger then a few dozen kilobytes (1).
{ .annotate }

1. The plugin also pools its internal buffers for maximum memory efficiency!

You only have to set the header and get a stream for the file:
```cs hl_lines="3-4"
var request = HTTPRequest.CreatePost("https://server/post", callback);

request.SetHeader("content-type", "application/octet-stream");
request.UploadSettings.UploadStream = File.OpenRead("path/to/file");

request.Send();
```

The plugin takes care of stream, it will read only the amount it can send and will dispose the stream too when finished.

### Upload an `url-encoded` form

To upload an `url-encoded` form, the plugin provides an easy to use class, the `UrlEncodedStream` from the `Best.HTTP.Request.Upload.Forms` namespace.

Here's an example how you can use it:
```cs hl_lines="3-5"
var request = HTTPRequest.CreatePost("https://server/post", callback);

request.UploadSettings.UploadStream = new UrlEncodedStream()
                        .AddField("field 1", "value 1")
                        .AddField("field 2", "value 2");

request.Send();
```

While the `UrlEncodedStream` accepts and uploads binary data as a Base64 string, for these cases i suggest to use the `MultipartFormDataStream` (1).
{.annotate}

1. Of course, the server must accept `multipart/form-data` as the upload method in order to use `MultipartFormDataStream` !

### Upload an `multipart/form-data` form

From the same namespace (`Best.HTTP.Request.Upload.Forms`) as the `UrlEncodedStream`, we can use `MultipartFormDataStream` for multipart forms:

```cs hl_lines="3-10"
var request = HTTPRequest.CreatePost("https://server/post", callback);

var formStream = new MultipartFormDataStream()
                        .AddField("field 1", "value 1")
                        .AddField("field 2", "value 2", Encoding.UTF8);

formStream.AddStreamField("binary field", new MemoryStream(new byte[] { 1, 2, 3, 4 }));
formStream.AddStreamField("file field", File.OpenRead("..."), "filename", "image/png");

request.UploadSettings.UploadStream = formStream;

request.Send();
```

For textual values we can use the `AddField` function. It can accept an `System.Text.Encoding` instance to convert the value with that one and use its `WebName` property to set the fields mime-type. If no encoding is specified, `MultipartFormDataStream` falls back to use `System.Text.Encoding.UTF8`.

To send binary data the `AddStreamField` function can be used. It acceps a `System.IO.Stream` implementation, so practically it can upload any kind of streams.

### Upload an object as Json text

With the help of the `JSonDataStream<T>` class from the `Best.HTTP.Request.Upload` namespace, it's easy to upload an object to the server.

```cs hl_lines="1 3 7"
class DataClass { public string key1, key2; }

var data = new DataClass { key1 = "value 1", key2 = "value 2" };

var request = HTTPRequest.CreatePost("https://server/post", callback);

request.UploadSettings.UploadStream = new JSonDataStream<DataClass>(data);

request.Send();
```

!!! warning
    `JSonDataStream` does NOT convert the object to JSon right there when created, instead it keeps a reference to it until the remote server is ready to accept the data.
    This means that any change to the object will be reflected in the sent data too.

!!! tip "Because the Json serialization happens on the sending thread, it can efficiently send larger objects too!"

This class uses [LitJson](../third-party-notices.md/#litjson), bundled with the plugin.

### Uploading on-the-fly generated data

Whether you're dealing with on-the-fly audio samples, video chunks, or any other data that doesn't follow a predictable size or timing, 
`DynamicUploadStream` ensures a smooth and uninterrupted uploading process while it still remains easy to use.

It's also good if you getting lots of data quickly sometimes and slower other times or users uploading things at random.
It keeps sending your data even if there's a short pause. When you're done sending, just use the `Complete()` function.

As you'll see, handling even the most advanced scenarios is as straightforward as creating a stream and writing data into it:

```cs
using System.Collections;

using Best.HTTP;
using Best.HTTP.Request.Upload;

using UnityEngine;

public class DynamicUploader : MonoBehaviour
{
    private DynamicUploadStream dynamicStream;
    private HTTPRequest request;

    void Start()
    {
        // Start the uploading process
        StartCoroutine(UploadDataCoroutine());
    }

    IEnumerator UploadDataCoroutine()
    {
        // Create an HTTP POST request
        request = new HTTPRequest(new System.Uri("https://your.upload.endpoint"), HTTPMethods.Post);

        // Initialize the stream with content type (for example, 'audio/wav' for audio data)
        dynamicStream = new DynamicUploadStream("audio/wav");

        // Set the stream as the request's upload target
        request.UploadSettings.UploadStream = dynamicStream;

        // Send the request without waiting for it to finish, as we'll be feeding data into the stream dynamically
        request.Send();

        // Simulate getting dynamic data (like audio samples) and writing it to the stream
        for (int i = 0; i < 10; i++)
        {
            // Get data (in this case, we're just generating some dummy data for the sake of example)
            byte[] data = System.Text.Encoding.UTF8.GetBytes($"Data Chunk {i}");

            // Write data to our dynamic stream
            dynamicStream.Write(data, 0, data.Length);

            // Wait for a short duration before sending the next chunk
            yield return new WaitForSeconds(1.0f);
        }

        // Once all data is sent, mark the stream as complete
        dynamicStream.Complete();

        // Wait for the request to finish
        yield return request;

        // Log the response
        Debug.Log(request.Response.StatusCode);
    }
}
```

!!! tip "While generating the data, it's possible to check the amount of buffered, unsent bytes in the stream using the `BufferedLength` property."

!!! tip "You can start buffering up data in the stream while the request is connecting to the server."

## Progress Tracking

No matter how UploadStream is utilised or even used directly, progress tracking is an independent feature. 
Subscribing to progress events can be done by setting an event handler for `UploadSettings.OnUploadProgress`:

```cs
request.UploadSettings.OnUploadProgress += OnUploadProgress;

void OnUploadProgress(HTTPRequest req, long progress, long length)
    => Debug.Log($"Upload: {progress:N0}/{length:N0}");
```
The handler method receives the originating HTTPRequest itself, the number of bytes uploaded so far and the total length of the content being puloaded, or -1 if the length cannot be determined.
