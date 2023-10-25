---
comments: true
---
# HubConnection

Represents the main entry point for a SignalR Core connection. 

## **Fields**:
### **Uri**
: Gets the URI of the Hub endpoint. 
### **State**
: Gets the current state of this connection. 
### **Transport**
: Gets the current active [ITransport](ITransport.md) instance. 
### **Protocol**
: Gets the [IProtocol](IProtocol.md) implementation that will parse, encode, and decode messages. 
### **OnRedirected**
: Called when the connection is redirected to a new URI. 
### **OnConnected**
: Called when successfully connected to the hub. 
### **OnError**
: Called when an unexpected error happens and the connection is closed. 
### **OnClosed**
: Called when the connection is gracefully terminated. 
### **OnMessage**
: Called for every server-sent message. The return value determines further processing of the message. 
### **OnReconnecting**
: Called when the HubConnection starts its reconnection process after losing its underlying connection. 
### **OnReconnected**
: Called after a successful reconnection. 
### **OnTransportEvent**
: Called for transport-related events. 
### **AuthenticationProvider**
: Gets or sets the [IAuthenticationProvider](IAuthenticationProvider.md) implementation that will be used to authenticate the connection. 
### **NegotiationResult**
: Gets the negotiation response sent by the server. 
### **Options**
: Gets the [HubOptions](HubOptions.md) instance that were used to create the HubConnection. 
### **RedirectCount**
: Gets how many times this connection has been redirected. 
### **ReconnectPolicy**
: Gets or sets the reconnect policy that will be used when the underlying connection is lost. Defaults to null. 
### **Context**
: Logging context of this HubConnection instance. 
## **Methods**:

### **StartConnect**
: Initiates the connection process to the Hub. 

### **ConnectAsync**
: Initiates an asynchronous connection to the Hub and returns a task representing the operation. 

### **StartClose**
: Begins the process to gracefully close the connection. 

### **CloseAsync**
: Initiates an asynchronous close operation for the connection and returns a task representing the operation. 

### **Send**
: Invokes the specified method on the server without expecting a return value. 

### **SendAsync**
: Invokes the specified method on the server without expecting a return value. 

### **SendAsync**
: Invokes the specified method on the server without expecting a return value, with an option to cancel. 

### **On**
: Registers a callback to be invoked when the server calls the specified method with no parameters. 

### **Remove**
: Remove all event handlers for  that subscribed with an On call. 