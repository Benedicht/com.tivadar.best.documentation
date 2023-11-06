---
comments: true
---

# Intermediate Topics

## IDs

As of Socket.IO 4, the whole connection has a global ID and all namespaces (sockets) have theirs too.

### Connection ID

The connection's ID can be accessed through the `SocketManager`'s `Handshake` property:
!!! Example
    ```cs hl_lines="6"
    var manager = new SocketManager(new Uri("http://localhost:3000"));
    manager.Socket.On("connect", OnConnected);

    void OnConnected(SocketManager manager)
    {
      Debug.Log(manager.Handshake.Sid);
    }
    ```

### Socket ID

Per-socket ID, witch is received when the namespace (socket) is connected, can either be accessed through the connect event as a parameter, or later through the socket instance:
!!! Example
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

## Special Events

`connect` and `error` events are special as their type parameters are already defined. `connect` emits a `ConnectResponse` object that has only one field: `sid`

!!! Example
    ```cs
    manager.Socket.On<ConnectResponse>(SocketIOEventTypes.Connect, OnConnected);

    void OnConnected(ConnectResponse resp)
    {
	    Debug.Log("Connected sid: " + resp.sid);
    }
    ```

Specifying a different type parameter for `connect` will produce an error.

On the other hand, while `error` has a predefined `Error` type with a `message` property, a new, custom error type can be created and used.

!!! Example
    For example a server-side middleware might want to send additional data other than just a plain text:

    ```js title="Server"
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

Using namespaces, logic can be separated both on the client and the server.
`SocketManager`'s `Socket` property is bound to the default, root ('/') namespace. Every subscription and event sent through this is sent to the root namespace. 

Using the `GetSocket` function, a new, custom namespace can be created and connected to. Note, that it must be available on the server too. 
For documentation about the server, check out the [Socket.IO Namespaces topic](https://socket.io/docs/v4/namespaces/).

!!! Example
    ```js title="Create custom namespace on the server"
    const nsp = io.of("/my-namespace");

    nsp.on("connection", socket => {
      console.log("someone connected");
    });
    ```

    ```cs title="Connect to a custom namespace"
    var manager = new SocketManager(new Uri(this.address));

    var myNamespace = manager.GetSocket("/my-namespace");
    myNamespace.On<ConnectResponse>(SocketIOEventTypes.Connect, OnMyNamespaceConnected);

    void OnMyNamespaceConnected(ConnectResponse resp)
    {
        Debug.Log("Connected to custom namespace!");
    }
    ```

## Rooms

[Rooms](https://socket.io/docs/v4/rooms/) are completely server-side features, no client support required!

## Reconnection

SocketManager will try to reconnect if all of the following preconditions are met:
1. there's a timeout or the transport unintentionally disconnects from the server, 
1. the SocketOptions' `Reconnection` is `true`.

During reconnection, `"disconnect"`, `"reconnect_attempt"`, `"reconnecting"` events are emitted. These are local events, generated locally.
Non-volatile events emitted to the server are buffered up and sent to the server once it could reconnect. 

!!! Tip "It's good practice to use [volatile events](../getting-started/sending.md#volatile-events) for non important events and/or pause event sending during reconnect."

[SocketOptions](socketoptions.md) has numerous properties to alter and fine-tune reconnection logic.
