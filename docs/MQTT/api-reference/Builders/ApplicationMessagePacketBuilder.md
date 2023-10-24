---
comments: true
---
# ApplicationMessagePacketBuilder

Builder to create an application message. https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901100


## **Methods**:

### **WithDuplicate**
: Set the duplicate flag. (Not really used, it's set directly in MessageDeliveryRetry function) 

### **WithPacketId**
: Send the packet with a packet ID required for > QoS 0. 

### **WithQoS**
: Build the packet with the given QoS level. 

### **WithRetain**
: Build the packet with the given retain flag. 

### **WithTopicName**
: Build the packet with the given topic name. 

### **WithPayloadFormatIndicator**
: Build the packet with the given payload format indicator. 

### **WithMessageExpiryInterval**
: Set the application message's expiry interval (it's in seconds). 

### **WithTopicAlias**
: https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901113 

### **WithResponseTopic**
: Set the application message's response topic. 

### **WithCorrelationData**
: Optional data sent with the application message. 

### **WithUserProperty**
: Optional key value pairs that will be sent with the application message. 

### **WithSubscriptionIdentifier**
: https://docs.oasis-open.org/mqtt/mqtt/v5.0/os/mqtt-v5.0-os.html#_Toc3901117 

### **WithContentType**
: Optional Content-Type value to help process the application message's payload. 

### **WithPayload**
: Set the application message's payload. 

### **WithPayload**
: Set the application message's payload. It also sets the payload format indicator to PayloadTypes.UTF8. 

### **BeginPublish**
: Begin sending the application message to the broker. 