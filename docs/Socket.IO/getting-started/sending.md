---
comments: true
---

# Sending Events

!!! Note "Start sending events only after a connect event!"

Sending an event can be done with the `Emit` function. Its first parameter is the name of the event, followed by an optional list of parameters.
A parameter can be any value with a simple type (like `int`, `float`, `char`, `string`, etc.) or complex object (like `Dictionary<>`, user defined classes and struct), until the parser of the `SocketManager` can encode/decode it.

When the Socket's Emit is called, the event name and all of its parameters if there's any, gets encoded by the `SocketManager`'s parser and sent over to the server on the current transport.

!!! Example
    ```cs title="Send message to the server"
    manager.Socket.Emit("message", "msg 1");
    ```

    ```js title="Subscription and event handling on the server-side"
    io.on("connection", (socket) => {
      socket.on('message', (msg) => {
          console.log(msg);
      });
    });
    ```

    On the server the message gets decoded and handled by the subscription. In this example, the `msg` variable will contain the `"msg 1"` string.

!!! Tip "To avoid any hard to catch issues, the number of parameters should match on both client and server side!"

## Examples

Here are some other examples.

!!! Example
    In this example, only the event will be sent, without any parameters.
    ```cs title="Send event without any parameter"
    manager.Socket.Emit("typing");
    ```

    ```js title="Matching server-side"
    io.on("connection", (socket) => {
      socket.on('typing', () => {
          console.log('typing event received!');
      });
    });
    ```

!!! Example
    In this example, the client is sending two parameters with the event. The first one is a number and the second one is an object.
    ```cs title="Send multiple parameters"
    sealed class NewMessageData
    {
        public string username;
        public string message;
    }

    var data = new NewMessageData { username = "User Name", message = "Hello World!"}
    manager.Socket.Emit("new_message", 0, data);
    ```

    ```js title="Matching server-side subscription"
    io.on("connection", (socket) => {
      socket.on('new_message', (index, data) => {
          console.log(`${index}: ${data.username} - ${data.message}`);
      });
    });
    ```

!!! Example
    This example is the same as the previous one, but instead of a concrete class(`NewMessageData`) it uses an [anonymous type](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/types/anonymous-types) for a more dynamic, javascript-ish feeling.

    ```cs title="Send multiple parameters"
    var data = new { username = "User Name", message = "Hello World!"}
    manager.Socket.Emit("new_message", 0, data);
    ```

    ```js title="Matching server-side subscription"
    io.on("connection", (socket) => {
      socket.on('new_message', (index, data) => {
          console.log(`${index}: ${data.username} - ${data.message}`);
      });
    });
    ```

## Volatile Events

A [volatile event](https://socket.io/docs/v4/emitting-events/#volatile-events) won't sent when the client can't send it right there.
When no transport is ready to send a volatile event, instead of buffering to send later, it will be discarded. 
An event can be marked as volatile by calling `Volatile()` on the socket first:

```cs
manager.Socket.Volatile().Emit("message", "msg 1");
```
