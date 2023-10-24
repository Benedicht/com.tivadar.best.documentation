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
### **ReconnectAttempts**
: How many reconnect attempts made. 
### **Parser**
: Parser to encode and decode messages and create strongly typed objects. 
### **Context**
: Logging context of this socket.io connection. 
### **OnIncomingPacket**
: Called for every packet received from the server. 
### **Timestamp**
: Timestamp support to the request based transports. 
### **NextAckId**
: Auto-incrementing property to return Ack ids. 
### **PreviousState**
: Internal property to store the previous state of the manager. 
### **UpgradingTransport**
: Transport currently upgrading. 
### **Namespaces**
: Namespace name -> Socket mapping 
### **Sockets**
: List of the sockets to able to iterate over them easily. 
### **OfflinePackets**
: List of unsent packets. Only instantiated when we have to use it. 
### **LastHeartbeat**
: When we sent out the last heartbeat(Ping) message. 
### **ReconnectAt**
: When we have to try to do a reconnect attempt 
### **ConnectionStarted**
: When we started to connect to the server. 
### **closing**
: Private flag to avoid multiple Close call 
### **lastPingReceived**
: In Engine.io v4 / socket.io v3 the server sends the ping messages, not the client. 
## **Methods**:

### **#ctor**
: Constructor to create a SocketManager instance that will connect to the given uri. 

### **#ctor**
: Constructor to create a SocketManager instance. 

### **GetSocket**
: Returns with the "/" namespace, the same as the Socket property. 

### **GetSocket**
: Returns with the specified namespace 

### **Best#SocketIO#IManager#Remove**
: Internal function to remove a Socket instance from this manager. 

### **Open**
: This function will begin to open the Socket.IO connection by sending out the handshake request. If the Options' AutoConnect is true, it will be called automatically. 

### **Close**
: Closes this Socket.IO connection. 

### **Best#SocketIO#IManager#Close**
: Closes this Socket.IO connection. 

### **Best#SocketIO#IManager#TryToReconnect**
: Called from a ITransport implementation when an error occurs and we may have to try to reconnect. 

### **SelectTransport**
: Select the best transport to send out packets. 

### **SendOfflinePackets**
: Will select the best transport and sends out all packets that are in the OfflinePackets list. 

### **Best#SocketIO#IManager#SendPacket**
: Internal function that called from the Socket class. It will send out the packet instantly, or if no transport is available it will store the packet in the OfflinePackets list. 

### **Best#SocketIO#IManager#OnPacket**
: Called from the currently operating Transport. Will pass forward to the Socket that has to call the callbacks. 

### **EmitAll**
: Sends an event to all available namespaces. 

### **Best#SocketIO#IManager#EmitEvent**
: Emits an internal packet-less event to the root namespace without creating it if it isn't exists yet. 

### **Best#SocketIO#IManager#EmitEvent**
: Emits an internal packet-less event to the root namespace without creating it if it isn't exists yet. 

### **Best#HTTP#Shared#Extensions#IHeartbeat#OnHeartbeatUpdate**
: Called from the HTTPManager's OnUpdate function every frame. It's main function is to send out heartbeat messages. 