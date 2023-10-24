---
comments: true
---

# Getting Started

EventSource is a one-way string-based protocol. 
Data comes from the server, and there are no option to send anything to the server. It's implemented using the [latest specification](https://html.spec.whatwg.org/multipage/server-sent-events.html).

## Usage Guide for `EventSource`

The `EventSource` class offers a simple way to establish and manage communication based on the Server-Sent Events protocol.

## Initializing `EventSource`

Connect to a Server-Sent Events endpoint:

```cs
using Best.ServerSentEvents;
var sse = new EventSource(new Uri("https://server/sse"));
```


## Starting and Stopping

```cs title="Starting the connection"
sse.Open();
```

```cs title="Stopping the connection"
sse.Close();
```

## Listening to Basic Events

```cs title="Connection Establishment"
sse.OnOpen += OnEventSourceOpened;

void OnEventSourceOpened(EventSource source)
{
    Debug.log("Connection established!");
}
```

```cs title="Receiving Messages"
sse.OnMessage += OnEventSourceMessage;

void OnEventSourceMessage(EventSource source, Message msg)
{
    Debug.log($"Received message: {msg.Data}");
}
```

## Subscribing to Custom Events

```cs title="Listen to specific events dispatched by the server"
sse.On("userLogon", OnUserLoggedIn);

void OnUserLoggedIn(EventSource source, Message msg)
{
    Debug.log($"User logged in: {msg.Data}");
}
```

## Handling Errors and Reconnections

```cs title="Error Handling"
sse.OnError += OnEventSourceError;

void OnEventSourceError(EventSource source, string error)
{
    Debug.log($"Error encountered: {error}");
}
```

```cs title="Managing Reconnections"
sse.OnRetry += OnEventSourceRetry;

bool OnEventSourceRetry(EventSource source)
{
    Debug.log("Attempting reconnection...");
    return true;  // Allow reconnection. Returning false will prevent retry.
}
```

## Unsubscribing from Events

```cs title="To stop listening to a specific event"
sse.Off("userLogon");
```