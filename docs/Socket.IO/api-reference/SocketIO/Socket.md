---
comments: true
---
# Socket

This class represents a Socket.IO namespace. 

## **Fields**:
### **Manager**
: The SocketManager instance that created this socket. 
### **Namespace**
: The namespace that this socket is bound to. 
### **Id**
: Unique Id of the socket. 
### **IsOpen**
: True if the socket is connected and open to the server. False otherwise. 
## **Methods**:

### **#ctor**
: Internal constructor. 

### **Best#SocketIO#ISocket#Open**
: Internal function to start opening the socket. 

### **Disconnect**
: Disconnects this socket/namespace. 

### **Best#SocketIO#ISocket#Disconnect**
: Disconnects this socket/namespace. 

### **Volatile**
: By emitting a volatile event, if the transport isn't ready the event is going to be discarded. 

### **Off**
: Remove all callbacks for all events. 

### **Off**
: Removes all callbacks to the given event. 

### **Off**
: Removes all callbacks to the given event. 

### **Best#SocketIO#ISocket#OnPacket**
: Last call of the OnPacket chain(Transport -> Manager -> Socket), we will dispatch the event if there is any callback 

### **Best#SocketIO#ISocket#EmitEvent**
: Emits an internal packet-less event to the user level. 

### **Best#SocketIO#ISocket#EmitEvent**
: Emits an internal packet-less event to the user level. 

### **OnTransportOpen**
: Called when the underlying transport is connected 