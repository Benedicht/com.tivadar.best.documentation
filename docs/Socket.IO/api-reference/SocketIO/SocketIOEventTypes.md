---
comments: true
---
# SocketIOEventTypes

Event types of the SocketIO protocol. 

## **Fields**:
### **SocketIOEventTypes.Connect**
: Connect to a namespace, or we connected to a namespace 
### **SocketIOEventTypes.Disconnect**
: Disconnect a namespace, or we disconnected from a namespace. 
### **SocketIOEventTypes.Event**
: A general event. The event's name is in the payload. 
### **SocketIOEventTypes.Ack**
: Acknowledgment of an event. 
### **SocketIOEventTypes.Error**
: Error sent by the server, or by the plugin 
### **SocketIOEventTypes.BinaryEvent**
: A general event with binary attached to the packet. The event's name is in the payload. 
### **SocketIOEventTypes.BinaryAck**
: Acknowledgment of a binary event. 