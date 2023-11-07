---
comments: true
---
# ConnectionOptionsBuilder

Builder class to help creating [ConnectionOptions](ConnectionOptions.md) instances. 

## Examples
!!! Example
	 The following example creates a [ConnectionOptions](ConnectionOptions.md) to connect to localhost on port 1883 using the TCP transport and MQTT protocol version v3.1.1. 
	```cs
	var options = new ConnectionOptionsBuilder()
	        .WithTCP("localhost", 1883)
	        .WithProtocolVersion(SupportedProtocolVersions.MQTT_3_1_1)
	        .Build();
	
	    var client = new MQTTClient(options);
	```
!!! Example
	 This is the same as the previous example, but the builder creates the [MQTTClient](MQTTClient.md) too. 
	```cs
	var client = new ConnectionOptionsBuilder()
	        .WithTCP("localhost", 1883)
	        .WithProtocolVersion(SupportedProtocolVersions.MQTT_3_1_1)
	        .CreateClient();
	```

## **Methods**:

### [ConnectionOptionsBuilder]() WithTCP([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32))
: Add options for a TCP connection. 

### [ConnectionOptionsBuilder]() WithWebSocket([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32))
: Add options for a WebSocket connection. 

### [ConnectionOptionsBuilder]() WithTLS()
: When used MQTTClient going to use TLS to secure the communication. 

### [ConnectionOptionsBuilder]() WithPath([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Used by the WebSocket transport to connect to the given path. 

### [ConnectionOptionsBuilder]() WithProtocolVersion(SupportedProtocolVersions)
: The protocol version that the plugin has to use to connect with to the server. 

### [MQTTClient](MQTTClient.md) CreateClient()
: Creates an MQTTClient object with the already set options. 

### [ConnectionOptions](ConnectionOptions.md) Build()
: Creates the final ConnectionOptions instance. 