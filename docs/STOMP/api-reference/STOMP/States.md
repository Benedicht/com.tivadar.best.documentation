---
comments: true
---
# States

Represents the various states of the STOMP client during its lifecycle. 

## **Fields**:
### **States.Initial**
: Indicates the initial state of the client, before any connection attempt has been made. 
### **States.Connecting**
: Represents the state where the client is attempting to establish a connection with the STOMP broker using the configured transport. 
### **States.Connected**
: Indicates that the client has successfully connected to the STOMP broker. 
### **States.Disconnecting**
: Represents the state where the client is in the process of disconnecting from the STOMP broker. 
### **States.Disconnected**
: Indicates that the client has disconnected from the STOMP broker. 