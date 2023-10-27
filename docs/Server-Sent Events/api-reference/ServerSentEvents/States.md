---
comments: true
---
# States

Represents the possible states of an [EventSource](EventSource.md) object. 

## **Fields**:
### **States.Initial**
: Indicates the initial state of the [EventSource](EventSource.md), before any action has been taken. 
### **States.Connecting**
: Represents the state when the [EventSource](EventSource.md) is attempting to establish a connection. 
### **States.Open**
: Indicates that the [EventSource](EventSource.md) has successfully established a connection. 
### **States.Retrying**
: Represents the state when the [EventSource](EventSource.md) is attempting to reconnect after a connection loss. 
### **States.Closing**
: Indicates that the [EventSource](EventSource.md) is in the process of shutting down the connection. 
### **States.Closed**
: Represents the state when the [EventSource](EventSource.md) has completely closed the connection. 