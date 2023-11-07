---
comments: true
---
# ConnectPacketBuilder

TODO: add detailed description 

## Examples
!!! Example

	```cs title="In this example the `ConnectPacketBuilderCallback` returns with the builder received as its second parameter without modifying it.  In the callback a new `ConnectPacketBuilder` can be created, but it's easier just to use the one already passed in the parameter."
	var options = new ConnectionOptionsBuilder()
	        .WithTCP("test.mosquitto.org", 1883)
	        .Build();
	    client = new MQTTClient(options);
	    client.BeginConnect(ConnectPacketBuilderCallback);
	
	ConnectPacketBuilder ConnectPacketBuilderCallback(MQTTClient client, ConnectPacketBuilder builder)
	{
	    return builder;
	}
	```
!!! Example

	```cs title="Add UserName and Password"
	ConnectPacketBuilder ConnectPacketBuilderCallback(MQTTClient client, ConnectPacketBuilder builder)
	{
	    return builder.WithUserNameAndPassword("username", "password");
	}
	```

## **Methods**:

### [ConnectPacketBuilder]() WithCleanStart()
: This specifies whether the connection starts a new session or is a continuation of an existing session. When `WithCleanStart` is used, both the broker and client deletes theirs previously stored session data.  The client continues to use its client id. 

### [ConnectPacketBuilder]() WithKeepAlive([UInt16](https://learn.microsoft.com/en-us/dotnet/api/System.UInt16))
: Maximum seconds that can be pass between sending two packets to the broker. If no other packets are sent, the plugin will send ping requests to check and keep the connection alive. [https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901045](https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901045)

### [ConnectPacketBuilder]() WithLastWill([LastWillBuilder](LastWillBuilder.md))
: A last will can be added to the connection.  The will message will be published by the broker after the network connection is subsequently closed and either the Will Delay Interval has elapsed or the session ends,  unless the will message has been deleted by the broker on receipt of a DISCONNECT packet with Reason Code `NormalDisconnection` or a new network connection for the ClientID is opened before the Will Delay Interval has elapsed. 
	!!! note ""
		Situations in which the will message is published include, but are not limited to: 

		- An I/O error or network failure detected by the broker.
		- The client fails to communicate within the Keep Alive time.
		- The client closes the network connection without first sending a DISCONNECT packet with a Reason Code `NormalDisconnection`.
		- The broker closes the network connection without first receiving a DISCONNECT packet with a Reason Code `NormalDisconnection`.




### [ConnectPacketBuilder]() WithClientID([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: With this call the plugin's automatic client id generation can be overwritten. If not exists the client creates a session to store its state. If a session is available for this clientId, it loads and uses it. 
	!!! note ""
		When neither the `WithClientID` or `WithSession` are used, first time connecting to the broker the plugin generates a unique id and will use it for consecutive connections.


### [ConnectPacketBuilder]() WithSession(Session)
: 
	!!! note ""
		When neither the `WithClientID` or `WithSession` are used, first time connecting to the broker the plugin generates a unique id and will use it for consecutive connections.


### [ConnectPacketBuilder]() WithUserName([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Add a user name for authentication purposes. 

### [ConnectPacketBuilder]() WithPassword([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Add a password for authentication purposes. 

### [ConnectPacketBuilder]() WithUserNameAndPassword([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Add both user name and password for authentication purposes. 

### [ConnectPacketBuilder]() WithSessionExpiryInterval([UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32))
: When the Session expires the client and broker need not process the deletion of state atomically. If the Session Expiry Interval is absent the value `0` is used.  If it is set to `0`, or is absent, the session ends when the network connection is closed. If the *Session Expiry Interval* is `0xFFFFFFFF` (`uint.MaxValue`), the session does not expire. 
	!!! note ""
		- A client that only wants to process messages while connected will call `WithCleanStart` and set the *Session Expiry Interval* to `0`. It will not receive Application Messages published before it connected and has to subscribe afresh to any topics that it is interested in each time it connects.
		- A client might be connecting to a broker using a network that provides intermittent connectivity. This client can use a short *Session Expiry Interval* so that it can reconnect when the network is available again and continue reliable message delivery. If the client does not reconnect, allowing the session to expire, then Application Messages will be lost.
		- When a client connects with a long *Session Expiry Interval*, it is requesting that the broker maintain its MQTT session state after it disconnects for an extended period. Clients should only connect with a long *Session Expiry Interval* if they intend to reconnect to the broker at some later point in time. When a client has determined that it has no further use for the session it should disconnect with a *Session Expiry Interval* set to `0`.




### [ConnectPacketBuilder]() WithReceiveMaximum([UInt16](https://learn.microsoft.com/en-us/dotnet/api/System.UInt16))
: The client uses this value to limit the number of `QoS 1` and `QoS 2` publications that it is willing to process concurrently.  There is no mechanism to limit the `QoS 0` publications that the broker might try to send. The value of Receive Maximum applies only to the current Network Connection.  If the Receive Maximum value is absent then its value defaults to `65,535`. 

### [ConnectPacketBuilder]() WithMaximumPacketSize([UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32))
: The maximum packet size the client is willing to accept. If the maximum packet size is not present, no limit on the packet size is imposed beyond the limitations in the protocol as a result of the remaining length encoding and the protocol header sizes. 

### [ConnectPacketBuilder]() WithTopicAliasMaximum([UInt16](https://learn.microsoft.com/en-us/dotnet/api/System.UInt16))
: This value indicates the highest value that the client will accept as a topic alias sent by the broker. The client uses this value to limit the number of topic aliases that it is willing to hold on this connection. If topic alias maximum is absent or zero, the broker will not send any topic aliases to the client. 
	!!! note ""
		If not called, the plugin will use `ushort.MaxValue`(65535). To disable receiving topic aliases from the broker call it with 0.


### [ConnectPacketBuilder]() WithRequestResponseInformation([Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean))
: When called with `true` the client request the broker to return Response Information in the ServerConnectAckMessage.  
	!!! note ""
		The broker can choose not to include `Response Information` in the connect ack message, even if the client requested it!


### [ConnectPacketBuilder]() WithRequestProblemInformation([Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean))
: The client can use this function to indicate whether the ReasonString or UserProperties are sent in the case of failures.  If the value of request problem information is `false`, the broker may return a `ReasonString` or `UserProperties` on a *connect acknowledgement* or* disconnect* packet, but must not send a `ReasonString` or `UserProperties` on any packet other than* publish*, *connect acknowledgement* or* disconnect*.  If this value is `true`, the broker may return a `ReasonString` or `UserProperties` on any packet where it is allowed. 

### [ConnectPacketBuilder]() WithUserProperty([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: User Properties on the connect packet can be used to send connection related properties from the client to the broker.  The meaning of these properties is not defined by this specification. 

### [ConnectPacketBuilder]() WithExtendedAuthenticationMethod([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Set the name of the authentication method used for extended authentication. 

### WithExtendedAuthenticationData(Byte[])
: Set the binary data containing authentication data for extended authentication.  The contents of this data are defined by the authentication method. 