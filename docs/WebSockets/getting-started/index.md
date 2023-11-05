---
comments: true
---

# Create a new WebSocket instance

First of all, in a file where you want to use the WebSocket class, you have to add the right namespace using:
```cs
using Best.WebSockets;
```

To create a new `WebSocket` instance is as easy as calling its constructor:
!!! Example "`#!cs var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));`"

!!! Note "When the scheme `wss://` is used, a Secure WebSocet connection will be created. For unsecure connections `ws://` can be used instead."

## Events

### OnOpen

Called when connection to the server is established as a result of the [Open()](#open) method.
After this event the WebSocket’s `IsOpen` property will be `true` until either peer (the client or server) closes the connection or an error occurs.

!!! Example
    ```cs hl_lines="2 4 6"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.OnOpen += OnWebSocketOpen; // (1)!

    webSocket.Open(); // (2)!

    private void OnWebSocketOpen(WebSocket webSocket) // (3)!
    {
	    Debug.Log("WebSocket is now Open!");
    }
    ```

    1. Subscribe to the `OnOpen` event.
    2. Start connection procedure by valling `Open()`.
    3. Implementation of the OnOpen event handler.

Sening and receivingg text and binary events from the server are allowed only after this event.

### OnMessage

Called every time when a textual message received from the server.

!!! Example
    ```cs hl_lines="2 6"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.OnMessage += OnMessageReceived;

    webSocket.Open();

    private void OnMessageReceived(WebSocket webSocket, string message)
    {
	    Debug.Log("Text Message received from server: " + message);
    }
    ```

### OnBinary

Called every time when a binary blob message received from the server. The callback receives the data wrapped in a [BufferSegment](../../HTTP/api-reference/Memory/BufferSegment.md).
The received bytes can be accessed through the buffer's `Data` field. In most cases `Data` is a larger array then the received message so it's important to use the buffer's `Count` field instead of `Data.Length`!

!!! Example
    ```cs hl_lines="2 6 16"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.OnBinary += OnBinaryMessageReceived;

    webSocket.Open();

    private void OnBinaryMessageReceived(WebSocket webSocket, BufferSegment buffer)
    {
	    Debug.Log("Binary Message received from server. Length: " + buffer.Length);

        using (var stream = System.IO.File.OpenWrite("path\to\file"))
        {
            // 📛 This is BAD, don't use it like this!! 📛
            //stream.Write(buffer.Data, 0, buffer.Data.Length);

            // ✅ Good:
            stream.Write(buffer.Data, buffer.Offset, buffer.Count);
        }
    }
    ```

!!! warning "The content of the buffer must be used or copied to a new array in the callbacks because the plugin reuses the memory immediately after the callback by placing it back to the [BufferPool](../../HTTP/api-reference/Memory/BufferPool.md)!"

### OnClosed

Called when the websocket is closed by either peer (client or server), or when the underlying TCP connection is broken. It also gets called when it can't even connect or upgrade.

When the client closes the connection through the [Close](#close) function it can provide a Code and a Message that indicates the reason for closing. 
The server typically will echoes our Code and Message back.

!!! Example
    ```cs hl_lines="2 6 10"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.OnClosed += OnWebSocketClosed;

    webSocket.Open();

    private void OnWebSocketClosed(WebSocket webSocket, WebSocketStatusCodes code, string message)
    {
	    Debug.Log("WebSocket is now Closed!");

        if (code == WebSocketStatusCodes.NormalClosure)
        {
            // Closed by request
        }
        else
        {
            // Error
        }
    }
    ```

## Methods

!!! Note "All methods are non-blocking: `Open` and `Close` just starts the opening and closing logic, `Send` places the data to a buffer that will be picked up by the sender thread."

### Open

Calling `Open()` we can start the connection procedure to the server.

!!! Example
    ```cs
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.Open();
    ```
!!! note "Just as other calls, Open is **not** a blocking call. Messages can be sent to the server after an **OnOpen** event."

### Send

Send has a few overrides, but the most common ones are to send `string`s and `byte[]`s.

!!! Example
    ```cs hl_lines="10" title="Sending strings"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.OnOpen += OnWebSocketOpen;

    webSocket.Open();

    private void OnWebSocketOpen(WebSocket webSocket)
    {
	    Debug.Log("WebSocket is now Open!");

        webSocket.Send("Message to the Server");
    }
    ```

!!! Example
    ```cs hl_lines="13" title="Sending binary"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.OnOpen += OnWebSocketOpen;

    webSocket.Open();

    private void OnWebSocketOpen(WebSocket webSocket)
    {
	    Debug.Log("WebSocket is now Open!");

        // Allocate and fill up the buffer with data
        byte[] buffer = new byte[length];

        webSocket.Send(buffer);
    }
    ```

Large messages (larger than 32767 bytes by default) are sent fragmented to the server automatically.

Websocket frames produced by the `Send` methods are placed into an internal queue and a sender thread going to send them one by one as soon as it can. 
The [BufferedAmount](#bufferedamount) property keeps track the amount of bytes sitting in this queue. 

### `SendAsText(BufferSegment data)`

Will send data in the BufferSegment as a text frame and takes owenership over the memory region, releasing it to the [BufferPool](../../HTTP/api-reference/Memory/BufferPool.md) as soon as possible.
Using a BufferSegment instead of a `byte[]` can be more memory efficient, as it can place less pressure on the [Garbage Collector](https://docs.unity3d.com/Manual/performance-garbage-collector.html).

!!! Example
    ```cs hl_lines="18 26" title="Using SendAsText"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.OnOpen += OnWebSocketOpen;

    webSocket.Open();

    private void OnWebSocketOpen(WebSocket webSocket)
    {
	    Debug.Log("WebSocket is now Open!");

        // The text we want to send
        var textToSend = "...";
            
        // Calculate the number of bytes required by encoding a set of characters.
        int byteCount = System.Text.Encoding.UTF8.GetByteCount(textToSend);

        // Borrow a large enough byte[] from the BufferPool. 
        // By setting the second parameter to true, we let the BufferPool that the returned array can be larger than byteCount.
        var buffer = BufferPool.Get(byteCount, true);

        // Encode the string into the buffer
        System.Text.Encoding.UTF8.GetBytes(textToSend, 0, textToSend.Length, buffer, 0);

        // Wrap the buffer with a BufferSegment and use byteCount as the BufferSegment's Count.
        // Then pass it to the SendAsText method. 
        // 'buffer' will be released back to the BufferPool when its content is sent.
        ws.SendAsText(new BufferSegment(buffer, 0, byteCount));
    }
    ```

### `SendAsBinary(BufferSegment data)`

Will send the data in one or more binary frame and takes ownership over it, releasing back to the [BufferPool](../../HTTP/api-reference/Memory/BufferPool.md) when sent.

### Close

After all communication is done we should close the connection by calling the `Close()` method.

!!! Example
    ```cs hl_lines="10"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.OnOpen += OnWebSocketOpen;

    webSocket.Open();

    private void OnWebSocketOpen(WebSocket webSocket)
    {
	    Debug.Log("WebSocket is now Open!");

        webSocket.Close();
    }
    ```

!!! Note "You can’t reuse a closed WebSocket instance, you have to create and setup a new one."

## Properties

### IsOpen

It's `true` if the websocket connection is open for sending and receiving.

### State

It's more verbose about the sate of the WebSocket than the `IsOpen` property. State can be `Connecting`, `Open`, `Closing`, `Closed` and `Unknown`.

### BufferedAmount

The amount of unsent, buffered up data in bytes.