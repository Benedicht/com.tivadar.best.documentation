# TransportStates

Represents the possible states of a [HubConnection](../SignalR/HubConnection.md)'s transport ([WebSocketTransport](../Transports/WebSocketTransport.md) or [LongPollingTransport](../Transports/LongPollingTransport.md)). 

## **Fields**:
### **Initial**
: The initial state of the transport, before any connection attempts have been made. 
### **Connecting**
: The state when the transport is in the process of establishing a connection. 
### **Connected**
: The state when the transport has successfully established a connection. 
### **Closing**
: The state when the transport is in the process of closing the connection. 
### **Failed**
: The state when an attempt to establish or maintain a connection has failed. 
### **Closed**
: The state when the transport has successfully closed the connection. 