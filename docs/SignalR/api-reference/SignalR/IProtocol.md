# IProtocol

Interface for message encoding-decoding protocols used in a SignalR communication. 

## **Fields**:
### **Name**
: Name of the protocol. This name must be known by the server. 
### **Type**
: Type of the encoded message, it can be [Binary](../SignalR/TransferModes.md#binary) or [Text](../SignalR/TransferModes.md#text). 
### **Encoder**
: An optional [IEncoder](../SignalR/IEncoder.md) implementation if the implementation requires one. With its help, the protocol implementor is able to support different encoders for the same protocol (like a json protocol with pluggable LitJson or JSON .NET encoders). 
### **Connection**
: The parent [HubConnection](../SignalR/HubConnection.md) instance that the implementation can use to access type informations. 
## **Methods**:

### **ParseMessages**
: Parses binary message representations into a list of messages. 

### **EncodeMessage**
: Encodes a message into its binary representation. 

### **GetRealArguments**
: Converts argument values to their respective types. 

### **ConvertTo**
: Converts a value to a given type. 