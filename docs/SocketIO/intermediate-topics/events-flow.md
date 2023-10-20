---
comments: true
---

# Emitted events

All light blue rounded rectangles int this flow chart can be subscribed to:

 ![Events Flowchart](../media/events_flowchart.svg)
 
As described above `connect` and `error` are special events witch means they have parameters. Other emitted events have no parameters (other than the possibility of injecting `SocketManager` and `Socket` instances):

```csharp
manager.Socket.On("connecting", () => Debug.Log("connecting"));
manager.Socket.On("reconnect", () => Debug.Log("reconnect"));
manager.Socket.On("reconnecting", () => Debug.Log("reconnecting"));
// ...
```
 