---
comments: true
---
# ApplicationMessagePacketBuilder

Builder to create an application message. [https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901100](https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901100)


## **Methods**:

### [ApplicationMessagePacketBuilder]() WithQoS([QoSLevels](../Packets/QoSLevels.md))
: Build the packet with the given QoS level. 

### [ApplicationMessagePacketBuilder]() WithRetain([Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean))
: Build the packet with the given retain flag. 

### [ApplicationMessagePacketBuilder]() WithPayloadFormatIndicator([PayloadTypes](../Packets/PayloadTypes.md))
: Build the packet with the given payload format indicator. 

### [ApplicationMessagePacketBuilder]() WithMessageExpiryInterval([UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32))
: Set the application message's expiry interval (it's in seconds). 

### [ApplicationMessagePacketBuilder]() WithResponseTopic([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Set the application message's response topic. 

### WithCorrelationData(Byte[])
: Optional data sent with the application message. 

### [ApplicationMessagePacketBuilder]() WithUserProperty([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Optional key value pairs that will be sent with the application message. 

### [ApplicationMessagePacketBuilder]() WithContentType([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Optional Content-Type value to help process the application message's payload. 

### WithPayload(Byte[])
: Set the application message's payload. 

### [ApplicationMessagePacketBuilder]() WithPayload([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Set the application message's payload. It also sets the payload format indicator to PayloadTypes.UTF8. 

### Void BeginPublish()
: Begin sending the application message to the broker. 