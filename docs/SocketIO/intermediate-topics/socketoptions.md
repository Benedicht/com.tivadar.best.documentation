---
comments: true
---

# SocketOptions

You can pass a SocketOptions instance to the SocketManager's constructor. You can change the following options:

- **AdditionalQueryParams**: Additional query parameters that will be passed for accessed uris. If the value is null, or an empty string it will be not appended to the query only the key. *The keys and values must be escaped properly, as the plugin will not escape these.*

```csharp
SocketOptions options = new SocketOptions();
options.AdditionalQueryParams = new PlatformSupport.Collections.ObjectModel.ObservableDictionary<string, string>();
options.AdditionalQueryParams.Add("token", "< token value >");

var manager = new SocketManager(new Uri("http://localhost:3000"), options);
```

- **Reconnection**: Whether to reconnect automatically after a disconnect. Its default value is true.
- **ReconnectionAttempts**: Number of attempts before giving up. Its default value is Int.MaxValue.
- **ReconnectionDelay**: How long to initially wait before attempting a new reconnection. Affected by +/- RandomizationFactor. For example the default initial delay will be between 500ms to 1500ms. Its default value is 1000ms.
- **ReconnectionDelayMax**: Maximum amount of time to wait between reconnections. Each attempt increases the reconnection delay along with a randomization as above. Its default value is 5000ms.
- **RandomizationFactor**: It can be used to control the ReconnectionDelay range. Its default value is 0.5 and can be set between the 0..1 values inclusive.
- **Timeout**: Connection timeout before a "connect_error" and "connect_timeout" events are emitted. It's not the underlying tcp socket's connection timeout, it's for the socket.io protocol. Its default value is is 20000ms.
- **AutoConnect**: By setting this false, you have to call SocketManager's Open() whenever you decide it's appropriate.
- **ConnectWith**: The SocketManager will try to connect with the transport set to this property. It can be TransportTypes.Polling or TransportTypes.WebSocket.
- **HTTPRequestCustomizationCallback**: A callback that called for every `HTTPRequest` the socket.io protocol sends out. It can be used to further customize (add additional headers for example) requests. This callback is called for Websocket upgrade requests too on non-WebGL platforms.

```csharp
SocketOptions options = new SocketOptions();
options.HTTPRequestCustomizationCallback = (manager, request) =>
{
    request.AddHeader("Authorization", "Bearer <...>");
};

manager = new SocketManager(new Uri("http://localhost:3000"), options);
```

- **Auth**: Connecting to a namespace a client can send payload data. When the Auth callback function is set, the plugin going to call it when connecting to a namespace. Its return value going to be serialized by the Parser.

When you create a new SocketOptions object its properties are set to theirs default values.

```csharp
SocketOptions options = new SocketOptions();
options.Auth = (manager, socket) => new { token = "<token>" };

var manager = new SocketManager(new Uri("http://localhost:3000"), options);
```

- **WebsocketOptions**: Customization options for the websocket transport. See the next, [WebsocketOptions](websocketoptions.md) section for details.

```csharp
SocketOptions options = new SocketOptions();
socketOptions.WebsocketOptions.PingIntervalOverride = TimeSpan.FromSeconds(10);

var manager = new SocketManager(new Uri("http://localhost:3000"), options);
```
