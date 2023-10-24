---
comments: true
---

# Getting Started

## Connecting

First step to connect to a Socket.IO server is to create a SocketManager instance:

```cs
using Best.SocketIO;

var manager = new SocketManager(new Uri("http://localhost:3000"));
```

The official Socket.IO server implementation [binds to the /socket.io/](https://socket.io/docs/v4/server-options/#path) path, and the client will append it to the uri if the uri's path part isn't present.

By default, `SocketManager` going to start connecting to the server as soon as a namespace is accessed through its `Socket` property or `GetSocket` function:

```cs
using Best.SocketIO;

var manager = new SocketManager(new Uri("http://localhost:3000"));

// Accessing the root ("/") socket
var root = manager.Socket;

// or calling GetSocket triggers the connection procedure.
var customNamespace = manager.GetSocket("/my_namespace");

// At this point the manager already started to connect to the server
```

This auto connection can be disabled through a `SocketOptions` instance:

```cs hl_lines="4 12"
using Best.SocketIO;

SocketOptions options = new SocketOptions();
options.AutoConnect = false;

var manager = new SocketManager(new Uri("http://localhost:3000"), options);

var root = manager.Socket;
var customNamespace = manager.GetSocket("/my_namespace");

// AutoConnect is turned off, Open must be called
manager.Open();
```

This way the `SocketManager` will start connecting to the server when its `Open` function is called.

`Open` and connection to the server in general is non-blocking, the function returns immediately and messages are sent only after the `connect` event.

## Subscribing to events

Subscribing to Socket.IO events can be done through the `On` and `Once` functions. 
There's also an `ExpectAcknowledgement` function that can be used to define a callbacks that going to be called when [the server executes a callback function](https://socket.io/docs/v4/emitting-events/#acknowledgements).

### Parameterless events

All functions to subscribe to events support parameterless events. These events don't expect any parameters from the servers:

```cs
manager.Socket.On("connect", () => Debug.Log("connected!"));
```

### Strongly typed events

Both `On` and `Once` can accept numerous type parameters and try to parse the received event to match these types. For example the following call on the server:
```cs title="Server"
socket.emit('message', 0, 1);
```

This event can be caught with the followin subscription on the client:
```cs title="Client"
manager.Socket.On<int, int>("message", (arg1, arg2) => Debug.Log($"{arg1}, {arg2}"));
```
Here we subscribe to the event called `"message"`, expecting two `int` parameters.

Complex objects can be sent and subscribed to:

```cs title="Server"
socket.emit("user-info", {
    users: ["User 1", "User 2"],
    buff: Buffer.from([9, 8, 7, 6, 5, 4, 3, 2, 1])
});
```

```cs title="Client"
class UserInfo
{
    public string[] users;
    public byte[] buff;
}

manager.Socket.On<UserInfo>("user-info", OnUserInfo);

private void OnUserInfo(UserInfo userInfo)
{
    Debug.Log($"user-info: {string.Join(",", userInfo.users)}, buff: {userInfo.buff.Length}");
}
```

By default, any additional fields present in the receiving type that have no corresponding field in the JSON will be initialized to their default value. 

Binary data can be sent alone too:
```cs title="Server"
socket.emit('binary', Buffer.from([9, 8, 7, 6, 5, 4, 3, 2, 1]));
```

```cs title="Client"
manager.Socket.On<byte[]>("binary", OnBinaryMessage);

private void OnBinaryMessage(byte[] buffer)
{
    Debug.Log("OnBinaryMessage: " + buffer.Length);
}
```

## Server Acknowledgements

With `ExpectAcknowledgement`, we can set a callback that will be called:

```cs title="Client"
class ReturnVal
{
    public int code;
    public string msg;
}

manager.Socket.ExpectAcknowledgement<ReturnVal>(OnAcknowledgements)
    .Emit("chat message", "msg 1");

private void OnAcknowledgements(ReturnVal value)
{
    Debug.Log($"{value.code}, '{value.msg}'");
}
```

```cs title="Server"
socket.on('chat message', (msg, ack_callback) => {
    ack_callback({ code: 102, msg: 'ok ' + msg });
});
```

## Client Acknowledgements

With `EmitAck` the client can send back an acknowledgement to the server.

```cs title="Server"
socket.emit('wait_for_ack', 1, 2, 3, (p1, p2, p3) => {
    console.log(`wait_for_ack: ${p1}, ${p2}, ${p3}`);
});
```

```cs title="Client"
manager.Socket.On<Socket, int, int, int>("wait_for_ack", OnWaitForAck);

private void OnWaitForAck(Socket socket, int arg1, int arg2, int arg3)
{
    Debug.Log($"wait_for_ack: {arg1}, {arg2}, {arg3}");

    socket.EmitAck(arg3, arg2, arg1);
}
```


## Sending Events

Sending an event can be done with the `Emit` function:

```cs
manager.Socket.Emit("chat message", "msg 1");
```

Its first parameter is the name of the event, followed by any number of parameters.

### Volatile Events

A [volatile event](https://socket.io/docs/v4/emitting-events/#volatile-events) won't sent when the client can't send it right there.
When no transport is ready to send a volatile event, instead of buffering to send later, it will be discarded. 
An event can be marked as volatile by calling `Volatile()` on the socket first:

```cs
manager.Socket.Volatile().Emit("chat message", "msg");
```

## Disconnecting

`SocketManager`'s `Close` function closes all sockets, shuts down the transport and no more communication is done to the server.
Calling `Disconnect` on a socket disconnects only that socket, communication through other sockets are still possible. 
Disconnecting the last socket will also close the SocketManager.
