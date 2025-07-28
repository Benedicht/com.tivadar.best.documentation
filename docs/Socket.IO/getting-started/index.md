---
comments: true
---

# Getting Started

## Connecting

First step to connect to a Socket.IO server is to include its namespace (Best.SocketIO) and create a SocketManager instance:

```cs
using Best.SocketIO;

var manager = new SocketManager(new Uri("http://localhost:3000"));
```

!!! Tip "The official Socket.IO server implementation [binds to the /socket.io/](https://socket.io/docs/v4/server-options/#path) path, and the client will append it to the uri if the uri's path part isn't present. If you used a different path, you can include it in the uri declaration."

By default, `SocketManager` going to start connecting to the server as soon as a namespace is accessed through the `Socket` property or `GetSocket` function:

```cs hl_lines="6 8"
using Best.SocketIO;

var manager = new SocketManager(new Uri("http://localhost:3000"));

// Accessing the root ("/") socket
var root = manager.Socket;

// At this point the manager already started to connect to the server
```

This auto connection can be disabled by using and setting up a `SocketOptions` instance:

```cs hl_lines="4 11"
using Best.SocketIO;

SocketOptions options = new SocketOptions();
options.AutoConnect = false;

var manager = new SocketManager(new Uri("http://localhost:3000"), options);

var root = manager.Socket;

// AutoConnect is turned off, Open must be called
manager.Open();
```

This way the `SocketManager` will start connecting to the server only when its `Open` function is called.
Check out the [SocketOptions](../intermediate-topics/socketoptions.md) topic for more options and callbacks!

!!! Note "`Open` and any other functions of the `SocketManager` and `Socket` are non-blocking, they will return almost immediately aren't waiting for a server response."

## The Connect Event

To get notified when the connection to the server completes, we can subscribe to the `connect` default event:

```cs hl_lines="6 8-11"
using Best.SocketIO;
using Best.SocketIO.Events;

var manager = new SocketManager(new Uri("http://localhost:3000"));

manager.Socket.On<ConnectResponse>(SocketIOEventTypes.Connect, OnConnected);

void OnConnected(ConnectResponse resp)
{
    Debug.Log("Connected!");
}
```

## Disconnecting

`SocketManager`'s `Close` function closes all sockets, shuts down the transport and no more communication is done to the server.
Calling `Disconnect` on a socket disconnects only that socket, communication through other sockets are still possible. 
Disconnecting the last socket will also close the SocketManager.


## Complete Example

To put it together, here's a complete example.

!!! Example
    ```cs hl_lines="17 21 24 27 31-34 39"
    using System;

    using Best.SocketIO;
    using Best.SocketIO.Events;
    using UnityEngine;

    namespace SocketIOExample
    {
        public sealed class ChatSample : MonoBehaviour
        {
            private SocketManager manager;

            // Unity Start event
            void Start()
            {
                // Create and setup SocketOptions
                SocketOptions options = new SocketOptions();
                options.AutoConnect = false;

                // Create and setup SocketManager
                this.manager = new SocketManager(new Uri("http://localhost:3000"), options);

                // Set subscriptions
                manager.Socket.On<ConnectResponse>(SocketIOEventTypes.Connect, OnConnected);

                // Start connecting to the server
                this.manager.Open();
            }

            // Connected event handler implementation
            void OnConnected(ConnectResponse resp)
            {
                Debug.Log("Connected!");
            }

            // Unity OnDestroy event
            void OnDestroy()
            {
                this.manager?.Close();
                this.manager = null;
            }
        }
    }
    ```

!!! Tip "Getting-started isn't over yet, read the [how to subscribe to](subscriptions.md) and [send events](sending.md) topics too!"