---
comments: true
---
# SocketManager

Manages the connection and associated sockets for a Socket.IO server. 

## **Fields**:
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) ProtocolVersion**
: Supported Socket.IO protocol version 
### **States State**
: The current state of this Socket.IO manager. 
### **[SocketOptions](SocketOptions.md) Options**
: The SocketOptions instance that this manager will use. 
### **[Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) Uri**
: The Uri to the Socket.IO endpoint. 
### **[HandshakeData](HandshakeData.md) Handshake**
: The server sent and parsed Handshake data. 
### **ITransport Transport**
: The currently used main transport instance. 
### **[UInt64](https://learn.microsoft.com/en-us/dotnet/api/System.UInt64) RequestCounter**
: The Request counter for request-based transports. 
### **[Socket](Socket.md) Socket**
: The root("/") Socket. 
### **[Socket](Socket.md) Item**
: Indexer to access socket associated to the given namespace. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) ReconnectAttempts**
: How many reconnect attempts made. 
### **IParser Parser**
: Parser to encode and decode messages and create strongly typed objects. 
### **[LoggingContext](../../../HTTP/api-reference/Logger/LoggingContext.md) Context**
: Logging context of this socket.io connection. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-2)&lt;[SocketManager](), [IncomingPacket](IncomingPacket.md)&gt; OnIncomingPacket**
: Called for every packet received from the server. 
## **Methods**:

### [Socket](Socket.md) GetSocket()
: Returns with the "/" namespace, the same as the Socket property. 

### [Socket](Socket.md) GetSocket([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Returns with the specified namespace 

### Void Open()
: This function will begin to open the Socket.IO connection by sending out the handshake request. If the Options' AutoConnect is true, it will be called automatically. 

### Void Close()
: Closes this Socket.IO connection. 

### EmitAll(String, Object[])
: Sends an event to all available namespaces. 