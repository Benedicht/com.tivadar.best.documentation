---
comments: true
---

# WebSocketOptions

- **ExtensionsFactory**: A function to return with an array of `IExtension`. 
By default it returns with an array of one element, the per-message deflate extension. 
When returns with `null`, no extension will be negotiated with the server. It's not available under WebGL.

    ```cs hl_lines="2"
    SocketOptions options = new SocketOptions();
    socketOptions.WebsocketOptions.ExtensionsFactory = () => null;

    var manager = new SocketManager(new Uri("http://localhost:3000"), options);
    ```

- **PingIntervalOverride**: With this property it's possible to overwrite the default ping interval of the underlying websocket.
When set to `TimeSpan.Zero` or lower, Websocket pings will be disabled. It's not available under WebGL. It's default value is `TimeSpan.Zero`.
