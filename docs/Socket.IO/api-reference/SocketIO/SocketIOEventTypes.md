---
comments: true
---
# SocketIOEventTypes

Event types of the SocketIO protocol. 

## **Fields**:
### **Connect**
: Connect to a namespace, or we connected to a namespace 
### **Disconnect**
: Disconnect a namespace, or we disconnected from a namespace. 
### **Event**
: A general event. The event's name is in the payload. 
### **Ack**
: Acknowledgment of an event. 
### **Error**
: Error sent by the server, or by the plugin 
### **BinaryEvent**
: A general event with binary attached to the packet. The event's name is in the payload. 
### **BinaryAck**
: Acknowledgment of a binary event. 