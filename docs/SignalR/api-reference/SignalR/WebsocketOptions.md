---
comments: true
---
# WebsocketOptions

Represents configuration options specific to the WebSocket transport. 

## **Fields**:
### **[Func](https://learn.microsoft.com/en-us/dotnet/api/System.Func-1)&lt;`IExtension[]`&gt; ExtensionsFactory**
: Gets or sets the factory method to create WebSocket extensions. Defaults to [GetDefaultExtensions](../../../WebSockets/api-reference/WebSockets/WebSocket.md#getdefaultextensions). 
### **[Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable-1)&lt;[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan)&gt; PingIntervalOverride**
: Gets or sets the interval for sending ping messages to keep the [WebSocket](../../../WebSockets/api-reference/WebSockets/WebSocket.md) connection alive. If set to [TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan), it means there's no specific interval set and the default or global settings should be used. 
### **[Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable-1)&lt;[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan)&gt; CloseAfterNoMessageOverride**
: Gets or sets the maximum time allowed after not receiving any message on the WebSocket connection before considering closing it. If set to `null`, it means there's no specific limit set and the connection won't be closed due to inactivity. 