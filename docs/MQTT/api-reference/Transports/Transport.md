---
comments: true
---
# Transport

Abstract base class for concreate transport implementations. 

## **Fields**:
### **TransportStates State**
: State of the transport. 
### **[MQTTClient](../MQTT/MQTTClient.md) Parent**
: Parent MQTTClient instance that the transport is created for. 
### **[ConcurrentQueue](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Concurrent.ConcurrentQueue-1)&lt;`Packet`&gt; IncomingPackets**
: Received and parsed packets, sent by the server. 
### **[CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken) ConnectCancellationToken**
: Optional [CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken) for connection cancellation support. 
### **[LoggingContext](../../../HTTP/api-reference/Logger/LoggingContext.md) Context**
: Debug context of the transport. 