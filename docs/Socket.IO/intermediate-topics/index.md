---
comments: true
---

# Intermediate Topics

## IDs

As of Socket.IO 4, the connection has an ID and all namespaces (sockets) have a different one too. 

### Connection ID

The connection's ID can be accessed through the `SocketManager`'s `Handshake` property:

```cs
var manager = new SocketManager(new Uri("http://localhost:3000"));
manager.Socket.On("connect", () => Debug.Log(manager.Handshake.Sid));
```

### Socket ID

Per-socket ID, witch is received when the socket is connected, can either be accessed through the connect event as a parameter, or later through the socket instance:
```cs hl_lines="7 10"
manager = new SocketManager(new Uri("http://localhost:3000"), options);
manager.Socket.On<ConnectResponse>(SocketIOEventTypes.Connect, OnConnected);

void OnConnected(ConnectResponse resp)
{
    // Method 1: received as parameter
    Debug.Log("Sid through parameter: " + resp.sid);

    // Method 2: access through the socket
    Debug.Log("Sid through socket: " + manager.Socket.Id);
}
```

`ConnectResponse`'s `sid` and `Socket`'s `Id` are the same value.

!!! Note "`ConnectResponse` can be found in the *Best.SocketIO.Events* namespace."

### Inject SocketManager and Socket as callback parameters

While the client parses the parameters it can inject the `SocketManager` or the receiving `Socket` instance into the parameter list:

```cs title="Server"
socket.emit('binary', Buffer.from([9, 8, 7, 6, 5, 4, 3, 2, 1]));
```

```cs title="Client"
manager.Socket.On<SocketManager, Socket, byte[]>("binary", OnBinaryMessage);

private void OnBinaryMessage(SocketManager manager, Socket socket, byte[] buffer)
{
    Debug.Log("OnBinaryMessage: " + buffer.Length);
}
```

!!! Note "This only works with events sent by the server and not with locally generated events like `disconnect`!"

## Special Events

`connect` and `error` events are special as their type parameters are already defined. `connect` emits a `ConnectResponse` object that has only one field: `sid`

```cs
manager.Socket.On<ConnectResponse>(SocketIOEventTypes.Connect, OnConnected);

void OnConnected(ConnectResponse resp)
{
	Debug.Log("Connected sid: " + resp.sid);
}
```

Specifying a different type parameter for `connect` will produce an error.

On the other hand, while `error` has a predefined `Error` type with a `message` property a new, custom error type can be created and used.

For example a server-side middleware might want to send additional data other than just a plain text:

```cs title="Server"
io.use((socket, next) => {
    const err = new Error("not authorized");
    err.data = { content: "Please retry later", code: 101 };
    next(err);
});
```

```cs title="Client"
class ErrorData
{
    public int code;
    public string content;
}

// Error already defines the message property
class CustomError : Error
{
    public ErrorData data;

    public override string ToString()
    {
        return $"[CustomError {message}, {data?.code}, {data?.content}]";
    }
}

manager.Socket.On<CustomError>(SocketIOEventTypes.Error, OnError);

void OnError(CustomError args)
{
    Debug.LogError(string.Format("Error: {0}", args.ToString()));
}
```

## Namespaces

`SocketManager`'s `Socket` property is bound to the root ('/') namespace. Every subscription and event sent through this is sent to the root namespace. 
New namespaces can be accessed and connected to using the `GetSocket` function:
```cs
manager.GetSocket("/customNamespace").On(SocketIOEventTypes.Connect, OnNameSpaceConnected);
```

## Rooms

[Rooms](https://socket.io/docs/v4/rooms/) are completely server-side features, no client support required!


## Reconnection

When there's a timeout or the transport unintentionally disconnects from the server unintentionally the SocketOptions' `Reconnection` is `true`, the manager attempts to reconnect to the server. 
Reconnect logic can be modified through [SocketOptions](socketoptions.md).
