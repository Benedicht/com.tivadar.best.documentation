---
comments: true
---

# Downloading

About half of the use cases involving a HTTP request are revolving around downloading resources from a remote server, and we want to do it as fast, reliably and memory efficiently as possible.
To support all of these requirements, this version of the plugin unifies previously different scenarios. Now, every download is a streamed download, no matter how small or large the downloaded content is.
This ensures that setting up a request is easier and a seamingly complex use case has a simple solution too.

!!! danger "By default the plugin alows 1 MiB of buffered data. If the target content is larger, the download will pause indefinitely! If your content is presumably larger than this threshold, you can increase this limit or start consuming the content during download."

## How to access downloaded content

The plugin offers two main ways to access the downloaded data:

1. **Shortcuts** for the most common scenarios
2. **DownStream** for use-cases where the downloaded content can be processed in chunks

### Shortcuts

For small and simple use-cases we don't want to deal with streams and buffers and all of that, just an easy way to get what the server sent. 
For these cases the HTTPresponse class has a few ready to use shortcut properties. These properties still use the download-stream to get the content, but they hide all the boring details.
Here's the list of the available shortcut properties:

- **`#!cs byte[] Data { get; }`:** The raw content bytes downloaded from the server, in case of compressed data, it contains the uncompressed final bytes. Use the `Data` property if the content is small or the consuming API requires continous memory.
    
    ??? example
        ```cs hl_lines="9"
        void DataCallback(HTTPRequest req, HTTPResponse resp)
        {
            switch(req.State)
            {
                case HTTPRequestStates.Finished:
                    if (resp.IsSuccess)
                    {
                        // Write the downloaded bytes to a file
                        System.IO.File.WriteAllBytes("path", resp.Data);
                    }
                    else
                        Debug.LogError($"Server error({resp.StatusCode} - {resp.Message})!");
                    break;

                default:
                    Debug.LogError(req.State.ToString());
                    break;
            }
        }
        ```

- **`#!cs string DataAsText { get; }`:** This shortcut converts the raw content bytes to an utf-8 string.
    ??? example
        ```cs hl_lines="9"
        void TextCallback(HTTPRequest req, HTTPResponse resp)
        {
            switch (req.State)
            {
                case HTTPRequestStates.Finished:
                    if (resp.IsSuccess)
                    {
                       // log out the server's textual response
                       Debug.Log(resp.DataAsText);
                    }
                    else
                        Debug.LogError($"Server error({resp.StatusCode} - {resp.Message})!");
                    break;

                default:
                    Debug.LogError(req.State.ToString());
                    break;
            }
        }
        ```

- **`#!cs Texture2D DataAsTexture2D { get; }`:** Uses [ImageConversion.LoadImage](https://docs.unity3d.com/ScriptReference/ImageConversion.LoadImage.html) to return with a [Texture2D](https://docs.unity3d.com/ScriptReference/Texture2D.html).
    ??? example
        ```cs hl_lines="9"
        void ImageCallback(HTTPRequest req, HTTPResponse resp)
        {
            switch (req.State)
            {
                case HTTPRequestStates.Finished:
                    if (resp.IsSuccess)
                    {
                        // Assign texture to a material.
                        GetComponent<Renderer>().material.mainTexture = resp.DataAsTexture2D;
                    }
                    else
                        Debug.LogError($"Server error({resp.StatusCode} - {resp.Message})!");
                    break;

                default:
                    Debug.LogError(req.State.ToString());
                    break;
            }
        }
        ```

All of these properties are caching their returned object, calling them repeatedly doesn't do any further allocations.

!!! info "All of these shortcuts assume that the download completed and called _after_ the request's state became finished!"

### Streaming

With the help of the `HTTPResponse`'s `DownStream` property, we can access parts of the downloaded data while the download is still in progress.
`DownStream` is non-blocking by default, all of its functions return immediately with or without data, depending on whether there's any data in its buffers.
This means, we have to try to take data from the stream every frame, or use a thread with a blocking variant of the stream. 
In the following topics we'll explore these use-cases, but before we dive into these, we also have to talk about the `OnDownloadStarted` event that we will use for both cases:

#### The `OnDownloadStarted` event
Streaming doesn't have any differences in the request's setup, but to start processing data as soon as we just can, we can subscribe to the `OnDownloadStarted` event. 
This event is called when the plugin expects the server to send content, just right after, in the next frame, when the `DownStream` instance is created. 
We can use this callback to start our content processing logic.

```cs hl_lines="2 5-8"
var request = HTTPRequest.CreateGet("https://server/path/to/large/resource", OnRequestFinishedCallack);
request.DownloadSettings.OnDownloadStarted += OnDownloadStarted;
request.Send();

void OnDownloadStarted(HTTPRequest req, HTTPResponse resp, DownloadContentStream stream)
{
    Debug.Log("Download Started");
}
```

!!! Tip "This event is called only when the response has a status code of 2xx, and it does _NOT_ for redirects, request and server errors (4xx & 5xx status codes). Further reducing the number of edge cases you have to handle and code complexity you have to manage."

#### Streaming With polling

Let's see the code first, and discuss it in detail after:

```cs
IEnumerator ParseContent(DownloadContentStream stream)
{
    try
    {
        while (!stream.IsCompleted)
        {
            // Try to take out a download segment from the Download Stream.
            if (stream.TryTake(out var buffer))
            {
                // TODO: process data in the buffer

                // Make sure that the buffer is released back to the BufferPool.
                BufferPool.Release(buffer);
            }

            yield return null;
        }
    }
    finally
    {
        // Don't forget to Dispose the stream!
        stream.Dispose();
    }
}
```

- `#!cs IEnumerator ParseContent(DownloadContentStream stream)`: We are making a coroutine that can be consumed by Unity, this requires that our function's return value must be `IEnumerator`. When we will use we also want to pass a `DownloadContentStream` object to the function.
- `DownloadStream`'s `IsCompleted` returns `true` only when the download is completed, and there's no more data buffered in the stream to read.

- `#!cs stream.TryTake(out var buffer)` tries to take out a downloaded chunk from the stream and will return with `true` only if the buffer is a valid one with content. When the stream is empty it returns with `false`.
    
    !!! Note "Don't make any assumptions about data length, it's at least 1 byte and can be different every frame."

- `#!cs BufferPool.Release(buffer);` will release back the buffer to the `BufferPool`. It's not mandatory, and must be called only after the buffer is no longer in use!
- `#!cs yield return null;` skips to next frame.
- `#!cs stream.Dispose();` finally, we have to dispose the stream, releasing any resources held by it.

And now, we can modify the `OnDownloadStarted` callback to start the new coroutine:

```cs
private void OnDownloadStarted(HTTPRequest req, HTTPResponse resp, DownloadContentStream stream)
{
    Debug.Log("Download started!");

    StartCoroutine(ParseContent(stream));
}
```

It's done, we now have a working streaming download!

#### Streaming With blocking

!!! Note "The download itself is **always** done on a non-Unity main thread, it doesn't affect the running game logic and rendering!"

In this section we start over using only the code from the '[The `OnDownloadStarted` event](#the-ondownloadstarted-event)' section.

Because `DownloadContentStream` is non-blocking, we have to use a different kind of stream, a `BlockingDownloadContentStream`! Modify the request setup part, to include the following, highlighted code:
```cs hl_lines="4-5"
var request = HTTPRequest.CreateGet("https://server/path/to/large/resource", OnRequestFinishedCallack);

request.DownloadSettings.OnDownloadStarted += OnDownloadStarted;
request.DownloadSettings.DownloadStreamFactory = (req, resp, bufferAvailableHandler)
    => new BlockingDownloadContentStream(resp, req.DownloadSettings.ContentStreamMaxBuffered, bufferAvailableHandler);

request.Send();
```
`DownloadStreamFactory` is called when the plugin is in need of a new `DownloadContentStream` instance for the request. Fortunately, `BlockingDownloadContentStream` is a specialized `DownloadContentStream` so we can use it instead.

First, let's write the function that will consume the downloaded content:
```cs hl_lines="7 10 19 26"
int ConsumeDownloadStream(BlockingDownloadContentStream blockingStream)
{
    var crc = new CRC32();

    try
    {
        while (!blockingStream.IsCompleted)
        {
            // Take out a segment from the downloaded
            if (blockingStream.TryTake(out var buffer))
            {
                try
                {
                    // In this case content processing is just calculating the CRC checksum of the data.
                    crc.SlurpBlock(buffer.Data, buffer.Offset, buffer.Count);
                }
                finally
                {
                    BufferPool.Release(buffer);
                }
            }
        }
    }
    finally
    {
        blockingStream.Dispose();
    }

    return crc.Crc32Result;
}
```

This function's logic is very similar what we wrote in the [coroutine version](#streaming-with-polling)'s `ParseContent`: 

1. until the download isn't completed
    1. repeat the `#!cs TryTake(out var buffer)` call
        1. process the data
        2. release the buffer
2. and finally dispose the stream. 

That's it!

Now, we just have to use it:

1. For threading we will use [Task.Run](https://learn.microsoft.com/en-us/dotnet/api/system.threading.tasks.task.run) and wait for its completion, so have to modify `OnDownloadStarted` too to add the `async` keyword
2. await the `Task.Run` call where we call `ConsumeDownloadStream` too

```cs hl_lines="1"
async void OnDownloadStarted(HTTPRequest req, HTTPResponse resp, DownloadContentStream stream)
{
    Debug.Log("Download Started");

    var crc = await Task.Run<int>(() => ConsumeDownloadStream(stream as BlockingDownloadContentStream));

    Debug.Log($"Download finished! CRC: 0x{crc:X}");
}
```

## Progress Tracking

No matter how `DownloadStream` is utilised or even used directly, progress tracking is an independent feature. 
Subscribing to progress events can be done by setting an event handler for `DownloadSettings.OnDownloadProgress`:

```cs
request.DownloadSettings.OnDownloadProgress += OnDownloadProgress;

void OnDownloadProgress(HTTPRequest req, long progress, long length)
    => Debug.Log($"{progress:N0}/{length:N0}");
```

The handler method receives the originating HTTPRequest itself, the number of bytes downloaded so far and the total length of the content being downloaded, or -1 if the length cannot be determined.

*[MiB]: 1 Mebibyte = 1024 * 1024 bytes