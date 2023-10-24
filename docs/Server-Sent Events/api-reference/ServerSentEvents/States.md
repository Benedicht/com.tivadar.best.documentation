---
comments: true
---
# States

Represents the possible states of an [EventSource](../ServerSentEvents/EventSource.md) object. 

## **Fields**:
### **Initial**
: Indicates the initial state of the [EventSource](../ServerSentEvents/EventSource.md), before any action has been taken. 
### **Connecting**
: Represents the state when the [EventSource](../ServerSentEvents/EventSource.md) is attempting to establish a connection. 
### **Open**
: Indicates that the [EventSource](../ServerSentEvents/EventSource.md) has successfully established a connection. 
### **Retrying**
: Represents the state when the [EventSource](../ServerSentEvents/EventSource.md) is attempting to reconnect after a connection loss. 
### **Closing**
: Indicates that the [EventSource](../ServerSentEvents/EventSource.md) is in the process of shutting down the connection. 
### **Closed**
: Represents the state when the [EventSource](../ServerSentEvents/EventSource.md) has completely closed the connection. 