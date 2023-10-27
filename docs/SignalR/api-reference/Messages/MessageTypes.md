---
comments: true
---
# MessageTypes

Possible message types the SignalR protocol can use. 

## **Fields**:
### **MessageTypes.Handshake**
: This is a made up message type, for easier handshake handling. 
### **MessageTypes.Invocation**
: Represents the Invocation message type. [https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#invocation-message-encoding](https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#invocation-message-encoding)
### **MessageTypes.StreamItem**
: Represents the StreamItem message type. [https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#streamitem-message-encoding](https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#streamitem-message-encoding)
### **MessageTypes.Completion**
: Represents the Completion message type. [https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#completion-message-encoding](https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#completion-message-encoding)
### **MessageTypes.StreamInvocation**
: Represents the StreamInvocation message type. [https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#streaminvocation-message-encoding](https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#streaminvocation-message-encoding)
### **MessageTypes.CancelInvocation**
: Represents the CancelInvocation message type. [https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#cancelinvocation-message-encoding](https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#cancelinvocation-message-encoding)
### **MessageTypes.Ping**
: Represents the Ping message type. [https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#ping-message-encoding](https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#ping-message-encoding)
### **MessageTypes.Close**
: Represents the Close message type. [https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#close-message-encoding](https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/HubProtocol.md#close-message-encoding)