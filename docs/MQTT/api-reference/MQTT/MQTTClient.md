---
comments: true
---
# MQTTClient

Represents an MQTT client, providing capabilities to connect to MQTT brokers, send and receive messages, and handle various MQTT events. This class is the central component for managing MQTT communications in an MQTT capable application. 

## **Fields**:
### **[ConnectionOptions](ConnectionOptions.md) Options**
: Connection related options. 
### **OnConnectedDelegate OnConnected**
: Called when the client successfully connected to the broker. 
### **OnServerConnectAckMessageDelegate OnServerConnectAckMessage**
: Called when the broker acknowledged the client's connect packet. 
### **OnApplicationMessageDelegate OnApplicationMessage**
: Called for every application message sent by the broker. 
### **OnAuthenticationMessageDelegate OnAuthenticationMessage**
: Called when an authentication packet is received from the broker as part of the extended authentication process. 
### **OnErrorDelegate OnError**
: Called when an unexpected, unrecoverable error happens. After this event an OnDisconnect event is called too. 
### **OnDisconnectDelegate OnDisconnect**
: Called after the client disconnects from the broker. 
### **OnStateChangedDelegate OnStateChanged**
: Called for every internal state change of the client. 
### **[ClientStates](ClientStates.md) State**
: Current state of the client. State changed events are emitted through the OnStateChanged event. 
### **[NegotiatedOptions](NegotiatedOptions.md) NegotiatedOptions**
: Options negotiated with the broker. 
### **Session Session**
: Session instance to persist QoS data. 
### **[LoggingContext](../../../HTTP/api-reference/Logger/LoggingContext.md) Context**
: Context of the MQTTClient and all child instances (like its transport, etc.) that can produce log outputs. 
## **Methods**:

### Void BeginPacketBuffer()
: With the use of BeginPacketBuffer and EndPacketBuffer sent messages can be buffered and sent in less network packets. It supports nested Begin-EndPacketBuffer calls. 
	!!! note ""
		Instead of using [BeginPacketBuffer](#void-beginpacketbuffer) and [EndPacketBuffer](#void-endpacketbuffer) directly, use the [PacketBufferHelper](PacketBufferHelper.md) instead!


### Void EndPacketBuffer()
: Call this after a BeginPacketBuffer. 
	!!! note ""
		Instead of using [BeginPacketBuffer](#void-beginpacketbuffer) and [EndPacketBuffer](#void-endpacketbuffer) directly, use the [PacketBufferHelper](PacketBufferHelper.md) instead!


### [ConnectPacketBuilder](../Builders/ConnectPacketBuilder.md) CreateConnectPacketBuilder()
: Creates and returns with a ConnectPacketBuilder instance. 

### Void BeginConnect(ConnectPacketBuilderDelegate, [CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken))
: Starts the connection process to the broker. It's a non-blocking method. ConnectPacketBuilderCallback is a function that will be called after a successfully transport connection to negotiate protocol details. 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[MQTTClient]()&gt; ConnectAsync(ConnectPacketBuilderDelegate, [CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken))
: Starts connecting to the broker.  

### DisconnectPacketBuilder CreateDisconnectPacketBuilder()
: Creates and returns with a DisconnectPacketBuilder instance. 

### [SubscribePacketBuilder](../Builders/SubscribePacketBuilder.md) CreateSubscriptionBuilder([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Creates and returns with a SubscribePacketBuilder.  

### [BulkSubscribePacketBuilder](../Builders/BulkSubscribePacketBuilder.md) CreateBulkSubscriptionBuilder()
: Creates and returns with a BulkSubscribePacketBuilder instance. 

### UnsubscribePacketBuilder CreateUnsubscribePacketBuilder([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Creates and returns with an UnsubscribePacketBuilder instance. 

### [BulkUnsubscribePacketBuilder](../Builders/BulkUnsubscribePacketBuilder.md) CreateBulkUnsubscribePacketBuilder()
: Creates and returns with a BulkUnsubscribePacketBuilder instance. 

### Void AddTopicAlias([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Adds a new topic alias. 

### [ApplicationMessagePacketBuilder](../Builders/ApplicationMessagePacketBuilder.md) CreateApplicationMessageBuilder([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Creates and returns with an ApplicationMessagePacketBuilder instance. 

### [AuthenticationPacketBuilder](../Builders/AuthenticationPacketBuilder.md) CreateAuthenticationPacketBuilder()
: Creates and returns with an AuthenticationPacketBuilder instance. 