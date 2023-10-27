---
comments: true
---
# HubConnection

Represents the main entry point for a SignalR Core connection. 

## **Fields**:
### **[Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) Uri**
: Gets the URI of the Hub endpoint. 
### **[ConnectionStates](ConnectionStates.md) State**
: Gets the current state of this connection. 
### **[ITransport](ITransport.md) Transport**
: Gets the current active [ITransport](ITransport.md) instance. 
### **[IProtocol](IProtocol.md) Protocol**
: Gets the [IProtocol](IProtocol.md) implementation that will parse, encode, and decode messages. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-3)&lt;[HubConnection](), [Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri), [Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri)&gt; OnRedirected**
: Called when the connection is redirected to a new URI. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-1)&lt;[HubConnection]()&gt; OnConnected**
: Called when successfully connected to the hub. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-2)&lt;[HubConnection](), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; OnError**
: Called when an unexpected error happens and the connection is closed. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-1)&lt;[HubConnection]()&gt; OnClosed**
: Called when the connection is gracefully terminated. 
### **[Func](https://learn.microsoft.com/en-us/dotnet/api/System.Func-3)&lt;[HubConnection](), [Message](../Messages/Message.md), [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)&gt; OnMessage**
: Called for every server-sent message. The return value determines further processing of the message. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-2)&lt;[HubConnection](), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; OnReconnecting**
: Called when the HubConnection starts its reconnection process after losing its underlying connection. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-1)&lt;[HubConnection]()&gt; OnReconnected**
: Called after a successful reconnection. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-3)&lt;[HubConnection](), [ITransport](ITransport.md), [TransportEvents](TransportEvents.md)&gt; OnTransportEvent**
: Called for transport-related events. 
### **[IAuthenticationProvider](IAuthenticationProvider.md) AuthenticationProvider**
: Gets or sets the [IAuthenticationProvider](IAuthenticationProvider.md) implementation that will be used to authenticate the connection. 
### **[NegotiationResult](../Messages/NegotiationResult.md) NegotiationResult**
: Gets the negotiation response sent by the server. 
### **[HubOptions](HubOptions.md) Options**
: Gets the [HubOptions](HubOptions.md) instance that were used to create the HubConnection. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) RedirectCount**
: Gets how many times this connection has been redirected. 
### **[IRetryPolicy](IRetryPolicy.md) ReconnectPolicy**
: Gets or sets the reconnect policy that will be used when the underlying connection is lost. Defaults to null. 
### **[LoggingContext](../../../HTTP/api-reference/Logger/LoggingContext.md) Context**
: Logging context of this HubConnection instance. 
## **Methods**:

### Void StartConnect()
: Initiates the connection process to the Hub. 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[HubConnection]()&gt; ConnectAsync()
: Initiates an asynchronous connection to the Hub and returns a task representing the operation. 

### Void StartClose()
: Begins the process to gracefully close the connection. 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[HubConnection]()&gt; CloseAsync()
: Initiates an asynchronous close operation for the connection and returns a task representing the operation. 

### Send(String, Object[])
: Invokes the specified method on the server without expecting a return value. 

### SendAsync(String, Object[])
: Invokes the specified method on the server without expecting a return value. 

### SendAsync(String, CancellationToken, Object[])
: Invokes the specified method on the server without expecting a return value, with an option to cancel. 

### Void On([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action))
: Registers a callback to be invoked when the server calls the specified method with no parameters. 

### Void Remove([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Remove all event handlers for  that subscribed with an On call. 