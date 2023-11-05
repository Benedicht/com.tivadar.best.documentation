---
comments: true
---

# Advanced Customizations

## SendPings

Set to `true` to let the plugin send ping messages periodically to the server. Its default value is false. It's not available under WebGL!

!!! Example
    ```cs hl_lines="2"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.SendPing = true;
    webSocket.Open();
    ```

## PingFrequency

The delay between two ping messages in milliseconds. Its default value is 1000 (1 second). It's not available under WebGL!

!!! Example
    ```cs hl_lines="2-3"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.SendPing = true;
    webSocket.PingFrequency = TimeSpan.FromMilliseconds(500);
    webSocket.Open();
    ```

## CloseAfterNoMesssage

If `SendPing` set to true, the plugin will close the connection and emit an `OnClosed` event if no message is received from the server in the given time. Its default value is 2 sec. It's not available under WebGL!

!!! Example
    ```cs hl_lines="2-4"
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.SendPing = true;
    webSocket.PingFrequency = TimeSpan.FromMilliseconds(500);
    webSocket.CloseAfterNoMesssage = TimeSpan.FromSeconds(1);
    webSocket.Open();
    ```

## InternalRequest

!!! Warning "It's NOT available under WebGL! Unfortunately, under WebGL there's no way to add any header to the request, but [you can let your voice heard!](https://github.com/whatwg/websockets/issues/16)"

The internal `HTTPRequest` object the plugin uses to send the websocket upgrade request to the server. 
To customize this internal request, use the `OnInternalRequestCreated` callback:

!!! Example
    ```cs hl_lines="7-9"
    using Best.WebSockets;
    using Best.HTTP.Request.Authenticators; // (1)

    string token = "...";

    var ws = new WebSocket(new Uri("wss://websocketserver/ws"));
    ws.OnInternalRequestCreated += 
        (ws, req) 
            => req.Authenticator = new BearerTokenAuthenticator(token); // (2)
    ```

    1. Documentation about Authenticators can be [found here](../../HTTP/getting-started/authentication.md).
    1. [BearerTokenAuthenticator](../../HTTP/getting-started/authentication.md#bearertokenauthenticator)

!!! Note "The plugin might call it more than once for one WebSocket instance if it has to fall back from the [HTTP/2 implementation](implementations.md) to HTTP/1."

## Extensions

Extensions are additions to the WebSocket protocols that must be negotiated first with the server to be able to use.
The Best WebSockets package supports and uses the Per-Message Compression Extension by default.

`IExtension` implementations the plugin will negotiate with the server to use. It's not available under WebGL!

## Latency

If `SendPings` is set to `true`, the plugin going to calculate Latency from the ping-pong message round-trip times. It's not available under WebGL!

## LastMessageReceived

When the last message is received from the server. It's not available under WebGL!

## Per-Message Compression Extension

The plugin enables and uses the [Per-Message Compression Extension](https://tools.ietf.org/html/rfc7692) by default. It can be disabled by passing null as the last (extensions) parameter of the websocket constructor.
To change defaults we can use the same constructor, but with a new `PerMessageCompression` object:

!!! Example
    ```csharp
    using BestHTTP.WebSocket;
    using BestHTTP.WebSocket.Extensions;

    var perMessageCompressionExtension = new PerMessageCompression(/*compression level: */           BestHTTP.Decompression.Zlib.CompressionLevel.Default,
                                                                   /*clientNoContextTakeover: */     false,
                                                                   /*serverNoContextTakeover: */     false,
                                                                   /*clientMaxWindowBits: */         BestHTTP.Decompression.Zlib.ZlibConstants.WindowBitsMax,
                                                                   /*desiredServerMaxWindowBits: */  BestHTTP.Decompression.Zlib.ZlibConstants.WindowBitsMax,
                                                                   /*minDatalengthToCompress: */     PerMessageCompression.MinDataLengthToCompressDefault);
    var webSocket = new WebSocket(new Uri("wss://echo.websocket.org/"), null, null, perMessageCompressionExtension);
    ```

Extension usage depends on the server too, but if the server agrees to use the extension, the plugin can receive and send compressed messages automatically.