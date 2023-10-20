## WebSocket

First of all, in a file where you want to use the WebSocket class, you have to add the right namespace using:
```cs
using Best.WebSockets;
```

To create a new `WebSocket` instance is as easy as calling its constructor:
!!! Example "`#!cs var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));`"

## Events

### OnOpen

Called when connection to the server is established.
After this event the WebSocket’s IsOpen property will be True until we or the server closes the connection or if an error occurs.

!!! Example
    ```cs hl_lines="2 6"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.OnOpen += OnWebSocketOpen;

    webSocket.Open();

    private void OnWebSocketOpen(WebSocket webSocket)
    {
	    Debug.Log("WebSocket is now Open!");
    }
    ```

### OnMessage

Called when a textual message received from the server.

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

Called when a binary blob message received from the server, it receives a [BufferSegment](../../HTTP/api-reference/Memory/BufferSegment.md).
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
            // 📛 This is BAD, don't use it like this!!
            //stream.Write(buffer.Data, 0, buffer.Data.Length);

            // ✅ Good:
            stream.Write(buffer.Data, buffer.Offset, buffer.Count);
        }
    }
    ```

!!! warning "The content of the buffer must be used or copied to a new array in the callbacks because the plugin reuses the memory immediately after the callback by placing it back to the [BufferPool](../../HTTP/api-reference/Memory/BufferPool.md)!"

### OnClosed

Called when the client or the server closes the connection.
When the client closes the connection through the Close function it can provide a Code and a Message that indicates the reason for closing. 
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

### OnInternalRequestCreated

Called when the internal `HTTPRequest` object created. The plugin might call it more than once for one WebSocket instance if it has to fall back from the HTTP/2 implementation to the HTTP/1 one. It's not available under WebGL.

## Methods

All methods are non-blocking, `Open` and `Close` just starts the opening and closing logic, `Send` places the data to a buffer that will be picked up by the sender thread.

### Open

Calling `Open()` we can start the connection procedure to the server.

```cs
var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
webSocket.Open();
```
!!! note "Just as other calls, Open is **not** a blocking call. Messages can be sent to the server after an **OnOpen** event."

### Send

Send has a few overrides, but the most common is to send text or binary.

Sending out text messages:
```cs hl_lines="10"
var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
webSocket.OnOpen += OnWebSocketOpen;

webSocket.Open();

private void OnWebSocketOpen(WebSocket webSocket)
{
	Debug.Log("WebSocket is now Open!");

    webSocket.Send("Message to the Server");
}
```

Sending out binary messages:
```cs hl_lines="13"
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

Large messages (larger than 32767 bytes by default) are sent fragmented to the server.

Websocket frames produced by the `Send` methods are placed into an internal queue and a sender thread going to send them one by one. The `BufferedAmount` property keeps track the amount of bytes sitting in this queue. 

### `SendAsText(BufferSegment data)`

Will send data as a text frame and takes owenership over the memory region releasing it to the [BufferPool](../../HTTP/api-reference/Memory/BufferPool.md) as soon as possible.

### `SendAsBinary(BufferSegment data)`

Will send the data in one or more binary frame and takes ownership over it calling [BufferPool](../../HTTP/api-reference/Memory/BufferPool.md). Release when sent.

### Close

After all communication is done we should close the connection by calling the `Close()` method.

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

!!! note "You can’t reuse a closed WebSocket instance, you have to create and setup a new one."

## Properties

### IsOpen

It's `true` if the websocket connection is open for sending and receiving.

### State

It's more verbose about the sate of the WebSocket than the `IsOpen` property. State can be `Connecting`, `Open`, `Closing`, `Closed` and `Unknown`.

### BufferedAmount

The amount of unsent, buffered up data in bytes.