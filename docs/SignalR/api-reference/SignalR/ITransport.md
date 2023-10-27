---
comments: true
---
# ITransport

Defines the basic structure and operations for a transport mechanism in a [HubConnection](HubConnection.md) context. Current implemtations are `WebSocketTransport` and `LongPollingTransport`. 

## **Fields**:
### **[TransferModes](TransferModes.md) TransferMode**
: Gets the transfer mode used by the transport, which defines whether it's [binary](TransferModes.md#transfermodesbinary) or [text](TransferModes.md#transfermodestext). 
### **[TransportTypes](TransportTypes.md) TransportType**
: Gets the type of the transport, such as [websocket](TransportTypes.md#transporttypeswebsocket) or [long-polling](TransportTypes.md#transporttypeslongpolling). 
### **TransportStates State**
: Gets the current state of the transport, which could be connecting, connected, closing, etc. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) ErrorReason**
: Gets a string representation of the reason for any errors that might have occurred during the transport's operations. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-2)&lt;`TransportStates`, `TransportStates`&gt; OnStateChanged**
: An event that's triggered whenever the state of the transport changes. It provides the previous state and the new state as its parameters. 
## **Methods**:

### Void StartConnect()
: Initiates the connection process for the transport. 

### Void StartClose()
: Initiates the process to close the transport's connection. 

### Void Send([BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md))
: Sends data over the transport using the provided [buffer segment](../../../HTTP/api-reference/Memory/BufferSegment.md). 