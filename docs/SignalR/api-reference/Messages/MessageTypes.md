# MessageTypes

Possible message types the SignalR protocol can use. 

## **Fields**:
### **Handshake**
: This is a made up message type, for easier handshake handling. 
### **Invocation**
: Represents the Invocation message type. https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#invocation-message-encoding
### **StreamItem**
: Represents the StreamItem message type. https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#streamitem-message-encoding
### **Completion**
: Represents the Completion message type. https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#completion-message-encoding
### **StreamInvocation**
: Represents the StreamInvocation message type. https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#streaminvocation-message-encoding
### **CancelInvocation**
: Represents the CancelInvocation message type. https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#cancelinvocation-message-encoding
### **Ping**
: Represents the Ping message type. https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#ping-message-encoding
### **Close**
: Represents the Close message type. https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#close-message-encoding