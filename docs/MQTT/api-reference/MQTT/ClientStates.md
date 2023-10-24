---
comments: true
---
# ClientStates

Possible states of the MQTTClient. 

## **Fields**:
### **Initial**
: State right after constructing the MQTTClient. 
### **TransportConnecting**
: Connection process initiated. 
### **TransportConnected**
: Transport successfully connected to the broker. 
### **Connected**
: Connect packet sent and acknowledgement received. 
### **Disconnecting**
: Disconnect process initiated. 
### **Disconnected**
: Client disconnected from the broker. This could be the result either of a graceful termination or an unexpected error. 