---
comments: true
---
# ClientStates

Possible states of the MQTTClient. 

## **Fields**:
### **ClientStates.Initial**
: State right after constructing the MQTTClient. 
### **ClientStates.TransportConnecting**
: Connection process initiated. 
### **ClientStates.TransportConnected**
: Transport successfully connected to the broker. 
### **ClientStates.Connected**
: Connect packet sent and acknowledgement received. 
### **ClientStates.Disconnecting**
: Disconnect process initiated. 
### **ClientStates.Disconnected**
: Client disconnected from the broker. This could be the result either of a graceful termination or an unexpected error. 