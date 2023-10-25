---
comments: true
---
# MQTTClient

Represents an MQTT client, providing capabilities to connect to MQTT brokers, send and receive messages, and handle various MQTT events. This class is the central component for managing MQTT communications in an MQTT capable application. 

## **Fields**:
### **Options**
: Connection related options. 
### **OnConnected**
: Called when the client successfully connected to the broker. 
### **OnServerConnectAckMessage**
: Called when the broker acknowledged the client's connect packet. 
### **OnApplicationMessage**
: Called for every application message sent by the broker. 
### **OnAuthenticationMessage**
: Called when an authentication packet is received from the broker as part of the extended authentication process. 
### **OnError**
: Called when an unexpected, unrecoverable error happens. After this event an OnDisconnect event is called too. 
### **OnDisconnect**
: Called after the client disconnects from the broker. 
### **OnStateChanged**
: Called for every internal state change of the client. 
### **State**
: Current state of the client. State changed events are emitted through the OnStateChanged event. 
### **NegotiatedOptions**
: Options negotiated with the broker. 
### **Session**
: Session instance to persist QoS data. 
### **Context**
: Context of the MQTTClient and all child instances (like its transport, etc.) that can produce log outputs. 
## **Methods**:

### **IncrementAndReplenishQueue**
: https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901251 

### **HandlePublishCompletePacket**
: https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901151 

### **HandlePublishReceivedPacket**
: https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901131 

### **HandlePublishReleasePacket**
: https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html 

### **HandlePublishPacket**
: https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901100 

### **HandleDisconnectPacket**
: https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901205 

### **MessageDeliveryRetry**
: When a Client reconnects with Clean Start set to 0 and a session is present, both the Client and Server MUST resend any unacknowledged PUBLISH packets (where QoS > 0) and PUBREL packets using their original Packet Identifiers.  https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901238 

### **BeginPacketBuffer**
: With the use of BeginPacketBuffer and EndPacketBuffer sent messages can be buffered and sent in less network packets. It supports nested Begin-EndPacketBuffer calls. 
	!!! note ""
		Instead of using [BeginPacketBuffer](MQTTClient.md#beginpacketbuffer) and [EndPacketBuffer](MQTTClient.md#endpacketbuffer) directly, use the [PacketBufferHelper](PacketBufferHelper.md) instead!


### **EndPacketBuffer**
: Call this after a BeginPacketBuffer. 
	!!! note ""
		Instead of using [BeginPacketBuffer](MQTTClient.md#beginpacketbuffer) and [EndPacketBuffer](MQTTClient.md#endpacketbuffer) directly, use the [PacketBufferHelper](PacketBufferHelper.md) instead!


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