---
comments: true
---
# IProtocol

Interface for message encoding-decoding protocols used in a SignalR communication. 

## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Name**
: Name of the protocol. This name must be known by the server. 
### **[TransferModes](TransferModes.md) Type**
: Type of the encoded message, it can be [binary](TransferModes.md#transfermodesbinary) or [textual](TransferModes.md#transfermodestext). 
### **[IEncoder](IEncoder.md) Encoder**
: An optional [IEncoder](IEncoder.md) implementation if the implementation requires one. With its help, the protocol implementor is able to support different encoders for the same protocol (like a json protocol with pluggable LitJson or JSON .NET encoders). 
### **[HubConnection](HubConnection.md) Connection**
: The parent [HubConnection](HubConnection.md) instance that the implementation can use to access type informations. 
## **Methods**:

### ParseMessages(BufferSegment, List)
: Parses binary message representations into a list of messages. 

### [BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md) EncodeMessage([Message](../Messages/Message.md))
: Encodes a message into its binary representation. 

### GetRealArguments(Type[], Object[])
: Converts argument values to their respective types. 

### [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object) ConvertTo([Type](https://learn.microsoft.com/en-us/dotnet/api/System.Type), [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object))
: Converts a value to a given type. 