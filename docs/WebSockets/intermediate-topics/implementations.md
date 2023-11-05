---
comments: true
---

# Implementations

The plugin now have three implementations:

## WebGL

Under WebGL the plugin **must** use the underlying browser's [WebSocket implementation](https://developer.mozilla.org/en-US/docs/Web/API/WebSocket). Browsers are exposing a limited API, hence not all features, methods and properties are available under this platform.

## HTTP/1 Upgrade

This implementation uses HTTP/1 upgrade mechanism. This is the default for every non-webgl platform.

## WebSocket Over HTTP/2

This new implementation is based on [RFC 8441](https://tools.ietf.org/html/rfc8441) and uses an already open HTTP/2 connection that advertised itself as one that supports the Extended Connect method.
If there's no open HTTP/2 connection the plugin uses the 'old' HTTP/1 based one. Because connecting over the already open HTTP/2 connection still can fail, the plugin can fallback to the HTTP/1 based one. When a fallback happens a new `HTTPRequest` object will be created by the new implementation and the `OnInternalRequestCreated` callback will be called again for this request too. 
If fallback is disabled WebSocket's `OnError` will be called.

This implementation uses the underlying HTTP/2 connection's framing mechanism, the maximum fragment size is the one that the HTTP/2 connection negotiated. 

Both WebSocket Over HTTP/2 and its fallback mechanism can be disabled:

!!! Example
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

There's a visual representation in the [Lifecycle](lifecycle.md) topic about how the upgrade attempt and fallback logic is done.