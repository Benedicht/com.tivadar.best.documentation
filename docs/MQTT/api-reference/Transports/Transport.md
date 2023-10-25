---
comments: true
---
# Transport

Abstract base class for concreate transport implementations. 

## **Fields**:
### **State**
: State of the transport. 
### **Parent**
: Parent MQTTClient instance that the transport is created for. 
### **IncomingPackets**
: Received and parsed packets, sent by the server. 
### **ConnectCancellationToken**
: Optional **CancellationToken** for connection cancellation support. 
### **Context**
: Debug context of the transport. 