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
### **lastInvocationId**
: This will be increment to add a unique id to every message the plugin will send. 
### **lastStreamId**
: Id of the last streaming parameter. 
### **invocations**
: Store the callback for all sent message that expect a return value from the server. All sent message has a unique invocationId that will be sent back from the server. 
### **subscriptions**
: This is where we store the methodname => callback mapping. 
### **lastMessageSentAt**
: When we sent out the last message to the server. 
## **Methods**:

### **#ctor**
: Initializes a new instance of the HubConnection class. 

### **#ctor**
: Initializes a new instance of the HubConnection class with specified [HubOptions](HubOptions.md) instance. 

### **StartConnect**
: Initiates the connection process to the Hub. 

### **ConnectAsync**
: Initiates an asynchronous connection to the Hub and returns a task representing the operation. 

### **StartClose**
: Begins the process to gracefully close the connection. 

### **CloseAsync**
: Initiates an asynchronous close operation for the connection and returns a task representing the operation. 

### **Invoke``1**
: Invokes the specified method on the server and returns an 

### **InvokeAsync``1**
: Asynchronously invokes the specified method on the and returns the result. 

### **InvokeAsync``1**
: Asynchronously invokes the specified method on the server with cancellation support and returns the result. 

### **Send**
: Invokes the specified method on the server without expecting a return value. 

### **SendAsync**
: Invokes the specified method on the server without expecting a return value. 

### **SendAsync**
: Invokes the specified method on the server without expecting a return value, with an option to cancel. 

### **GetDownStreamController``1**
: Initializes and retrieves a new downstream controller for the specified target.  This is used for handling server methods that send multiple items over time. 

### **GetUpStreamController``1**
: Initializes and retrieves a new upstream controller for sending multiple items to the server over time. 

### **On**
: Registers a callback to be invoked when the server calls the specified method with no parameters. 

### **On``1**
: Registers a callback to be invoked when the server calls the specified method. 

### **On``2**
: Registers a callback to be invoked when the server calls the specified method. 

### **On``3**
: Registers a callback to be invoked when the server calls the specified method. 

### **On``4**
: Registers a callback to be invoked when the server calls the specified method. 

### **On``1**
: Registers a function callback to be invoked when the server calls the specified function with no parameters, but expects a return value. 

### **On``2**
: Registers a function callback to be invoked when the server calls the specified function with no parameters. 

### **On``3**
: Registers a function callback to be invoked when the server calls the specified function with no parameters. 

### **On``4**
: Registers a function callback to be invoked when the server calls the specified function with no parameters. 

### **On``5**
: Registers a function callback to be invoked when the server calls the specified function with no parameters. 

### **OnFunc``1**
: 

### **Remove**
: Remove all event handlers for  that subscribed with an On call. 