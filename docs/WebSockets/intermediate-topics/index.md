---
comments: true
---

# Advanced Topics

## SendPings

Set to `true` to let the plugin send ping messages periodically to the server. Its default value is false. It's not available under WebGL!

??? Example
    ```cs
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.SendPing = true;
    webSocket.Open();
    ```

## PingFrequency

The delay between two ping messages in milliseconds. Its default value is 1000 (1 second). It's not available under WebGL!

??? Example
    ```cs
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.SendPing = true;
    webSocket.PingFrequency = TimeSpan.FromMilliseconds(500);
    webSocket.Open();
    ```

## CloseAfterNoMesssage

If `SendPing` set to true, the plugin will close the connection and emit an `OnClosed` event if no message is received from the server in the given time. Its default value is 2 sec. It's not available under WebGL!

??? Example
    ```cs
    var webSocket = new WebSocket(new Uri("wss://websocketserver/ws"));
    webSocket.SendPing = true;
    webSocket.PingFrequency = TimeSpan.FromMilliseconds(500);
    webSocket.CloseAfterNoMesssage = TimeSpan.FromSeconds(1);
    webSocket.Open();
    ```

## InternalRequest

!!! Warning "It's NOT available under WebGL! [Let your voice heard!](https://github.com/whatwg/websockets/issues/16)"

The internal `HTTPRequest` object the plugin uses to send the websocket upgrade request to the server. 
To customize this internal request, use the `OnInternalRequestCreated` callback:

```cs
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

## Implementations

The plugin now have three implementations:

### WebGL

Under WebGL the plugin **must** use the underlying browser's [WebSocket implementation](https://developer.mozilla.org/en-US/docs/Web/API/WebSocket). Browsers are exposing a limited API, hence not all features, methods and properties are available under this platform.

### HTTP/1 Upgrade

This implementation uses HTTP/1 upgrade mechanism. This is the default for every non-webgl platform.

### WebSocket Over HTTP/2

This new implementation is based on [RFC 8441](https://tools.ietf.org/html/rfc8441) and uses an already open HTTP/2 connection that advertised itself as one that supports the Extended Connect method.
If there's no open HTTP/2 connection the plugin uses the 'old' HTTP/1 based one. Because connecting over the already open HTTP/2 connection still can fail, the plugin can fallback to the HTTP/1 based one. When a fallback happens a new `HTTPRequest` object will be created by the new implementation and the `OnInternalRequestCreated` callback will be called again for this request too. 
If fallback is disabled WebSocket's `OnError` will be called.

This implementation uses the underlying HTTP/2 connection's framing mechanism, the maximum fragment size is the one that the HTTP/2 connection negotiated. 

Both WebSocket Over HTTP/2 and its fallback mechanism can be disabled:

```csharp
WebSocketOverHTTP2Settings settings = Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*").HTTP2ConnectionSettings.WebSocketOverHTTP2Settings;

// Disable WebSocket Over HTTP/2
settings.EnableWebSocketOverHTTP2 = false;

// Disable fallback mechanism
settings.HTTP2ConnectionSettings.WebSocketOverHTTP2Settings.EnableImplementationFallback = false;
```

Pros of WebSocket Over HTTP/2:

- Less resource usage both on the client and server
- It doesn't have to do the TCP and TLS handshake round trips
- Better utilization of TCP