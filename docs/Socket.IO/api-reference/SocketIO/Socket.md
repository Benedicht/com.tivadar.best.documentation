---
comments: true
---
# Socket

This class represents a Socket.IO namespace. 

## **Fields**:
### **[SocketManager](SocketManager.md) Manager**
: The SocketManager instance that created this socket. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Namespace**
: The namespace that this socket is bound to. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Id**
: Unique Id of the socket. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsOpen**
: True if the socket is connected and open to the server. False otherwise. 
## **Methods**:

### Void Disconnect()
: Disconnects this socket/namespace. 

### [EmitBuilder](EmitBuilder.md) Volatile()
: By emitting a volatile event, if the transport isn't ready the event is going to be discarded. 

### Void Off()
: Remove all callbacks for all events. 

### Void Off([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Removes all callbacks to the given event. 

### Void Off([SocketIOEventTypes](SocketIOEventTypes.md))
: Removes all callbacks to the given event. 