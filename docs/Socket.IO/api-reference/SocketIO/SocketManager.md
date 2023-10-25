---
comments: true
---
# SocketManager

Manages the connection and associated sockets for a Socket.IO server. 

## **Fields**:
### **ProtocolVersion**
: Supported Socket.IO protocol version 
### **State**
: The current state of this Socket.IO manager. 
### **Options**
: The SocketOptions instance that this manager will use. 
### **Uri**
: The Uri to the Socket.IO endpoint. 
### **Handshake**
: The server sent and parsed Handshake data. 
### **Transport**
: The currently used main transport instance. 
### **RequestCounter**
: The Request counter for request-based transports. 
### **Socket**
: The root("/") Socket. 
### **Item**
: Indexer to access socket associated to the given namespace. 
### **ReconnectAttempts**
: How many reconnect attempts made. 
### **Parser**
: Parser to encode and decode messages and create strongly typed objects. 
### **Context**
: Logging context of this socket.io connection. 
### **OnIncomingPacket**
: Called for every packet received from the server. 
## **Methods**:

### **GetSocket**
: Returns with the "/" namespace, the same as the Socket property. 

### **GetSocket**
: Returns with the specified namespace 

### **Open**
: This function will begin to open the Socket.IO connection by sending out the handshake request. If the Options' AutoConnect is true, it will be called automatically. 

### **Close**
: Closes this Socket.IO connection. 

### **EmitAll**
: Sends an event to all available namespaces. 