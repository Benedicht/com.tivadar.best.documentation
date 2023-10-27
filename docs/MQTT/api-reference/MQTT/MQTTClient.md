---
comments: true
---
# MQTTClient

Represents an MQTT client, providing capabilities to connect to MQTT brokers, send and receive messages, and handle various MQTT events. This class is the central component for managing MQTT communications in an MQTT capable application. 

## **Fields**:
### **[ConnectionOptions](ConnectionOptions.md) Options**
: Connection related options. 
### **[OnConnectedDelegate](OnConnectedDelegate.md) OnConnected**
: Called when the client successfully connected to the broker. 
### **[OnServerConnectAckMessageDelegate](OnServerConnectAckMessageDelegate.md) OnServerConnectAckMessage**
: Called when the broker acknowledged the client's connect packet. 
### **[OnApplicationMessageDelegate](OnApplicationMessageDelegate.md) OnApplicationMessage**
: Called for every application message sent by the broker. 
### **[OnAuthenticationMessageDelegate](OnAuthenticationMessageDelegate.md) OnAuthenticationMessage**
: Called when an authentication packet is received from the broker as part of the extended authentication process. 
### **[OnErrorDelegate](OnErrorDelegate.md) OnError**
: Called when an unexpected, unrecoverable error happens. After this event an OnDisconnect event is called too. 
### **[OnDisconnectDelegate](OnDisconnectDelegate.md) OnDisconnect**
: Called after the client disconnects from the broker. 
### **[OnStateChangedDelegate](OnStateChangedDelegate.md) OnStateChanged**
: Called for every internal state change of the client. 
### **[ClientStates](ClientStates.md) State**
: Current state of the client. State changed events are emitted through the OnStateChanged event. 
### **[NegotiatedOptions](NegotiatedOptions.md) NegotiatedOptions**
: Options negotiated with the broker. 
### **[Session](Session.md) Session**
: Session instance to persist QoS data. 
### **[LoggingContext](../../../HTTP/api-reference/Logger/LoggingContext.md) Context**
: Context of the MQTTClient and all child instances (like its transport, etc.) that can produce log outputs. 
## **Methods**:

### **BeginPacketBuffer**
: With the use of BeginPacketBuffer and EndPacketBuffer sent messages can be buffered and sent in less network packets. It supports nested Begin-EndPacketBuffer calls. 
	!!! note ""
		Instead of using [BeginPacketBuffer](#beginpacketbuffer) and [EndPacketBuffer](#endpacketbuffer) directly, use the [PacketBufferHelper](PacketBufferHelper.md) instead!


### **EndPacketBuffer**
: Call this after a BeginPacketBuffer. 
	!!! note ""
		Instead of using [BeginPacketBuffer](#beginpacketbuffer) and [EndPacketBuffer](#endpacketbuffer) directly, use the [PacketBufferHelper](PacketBufferHelper.md) instead!


### **CreateConnectPacketBuilder**
: Creates and returns with a ConnectPacketBuilder instance. 

### **BeginConnect**
: Starts the connection process to the broker. It's a non-blocking method. ConnectPacketBuilderCallback is a function that will be called after a successfully transport connection to negotiate protocol details. 

### **ConnectAsync**
: Starts connecting to the broker.  

### **CreateDisconnectPacketBuilder**
: Creates and returns with a DisconnectPacketBuilder instance. 

### **CreateSubscriptionBuilder**
: Creates and returns with a SubscribePacketBuilder.  

### **CreateBulkSubscriptionBuilder**
: Creates and returns with a BulkSubscribePacketBuilder instance. 

### **CreateUnsubscribePacketBuilder**
: Creates and returns with an UnsubscribePacketBuilder instance. 

### **CreateBulkUnsubscribePacketBuilder**
: Creates and returns with a BulkUnsubscribePacketBuilder instance. 

### **AddTopicAlias**
: Adds a new topic alias. 

### **CreateApplicationMessageBuilder**
: Creates and returns with an ApplicationMessagePacketBuilder instance. 

### **CreateAuthenticationPacketBuilder**
: Creates and returns with an AuthenticationPacketBuilder instance. 