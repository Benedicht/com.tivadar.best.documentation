---
comments: true
---
# HubOptions

Represents the configuration options for a [HubConnection](HubConnection.md). 

## **Fields**:
### **SkipNegotiation**
: When this is set to true, the plugin will skip the negotiation request if the PreferedTransport is WebSocket. Its default value is false. 
### **PreferedTransport**
: The preferred transport to choose when more than one available. Its default value is TransportTypes.WebSocket. 
### **PingInterval**
: A ping message is only sent if the interval has elapsed without a message being sent. Its default value is 15 seconds. 
### **PingTimeoutInterval**
: If the client doesn't see any message in this interval, considers the connection broken. Its default value is 30 seconds. 
### **MaxRedirects**
: The maximum count of redirect negotiation result that the plugin will follow. Its default value is 100. 
### **ConnectTimeout**
: The maximum time that the plugin allowed to spend trying to connect. Its default value is 1 minute. 
### **WebsocketOptions**
: Customization options for the websocket transport. 