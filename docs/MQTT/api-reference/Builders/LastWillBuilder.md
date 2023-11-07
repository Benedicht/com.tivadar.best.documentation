---
comments: true
---
# LastWillBuilder

TODO:  


## **Methods**:

### [LastWillBuilder]() WithTopic([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Set the topic the last-will will be published. 

### WithPayload(Byte[])
: Binary payload of the last-will. 

### [LastWillBuilder]() WithPayload([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Textual payload of the last-will. It also sets the Payload Format Indicator to UTF8. 

### [LastWillBuilder]() WithQoS([QoSLevels](../Packets/QoSLevels.md))
: QoS level of the last-will. 

### [LastWillBuilder]() WithRetain([Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean))
: Retain flag. 

### [LastWillBuilder]() WithDelayInterval([UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32))
: Delay before the broker will publish the last-will 

### [LastWillBuilder]() WithPayloadFormatIndicator(PayloadTypes)
: Type of the payload, binary or textual. 