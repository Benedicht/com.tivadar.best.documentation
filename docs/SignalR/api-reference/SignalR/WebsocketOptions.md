---
comments: true
---
# WebsocketOptions

Represents configuration options specific to the WebSocket transport. 

## **Fields**:
### **ExtensionsFactory**
: Gets or sets the factory method to create WebSocket extensions. Defaults to [GetDefaultExtensions](../../../WebSockets/api-reference/WebSockets/WebSocket.md#getdefaultextensions). 
### **PingIntervalOverride**
: Gets or sets the interval for sending ping messages to keep the [WebSocket](../../../WebSockets/api-reference/WebSockets/WebSocket.md) connection alive. If set to **TimeSpan.Zero**, it means there's no specific interval set and the default or global settings should be used. 
### **CloseAfterNoMessageOverride**
: Gets or sets the maximum time allowed after not receiving any message on the WebSocket connection before considering closing it. If set to `null`, it means there's no specific limit set and the connection won't be closed due to inactivity. 