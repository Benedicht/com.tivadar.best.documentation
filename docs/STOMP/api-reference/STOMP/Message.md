---
comments: true
---
# Message

Represents a message received from the broker, containing details about the subscription, headers, and content. 

## **Fields**:
### **[Subscription](Subscription.md) Subscription**
: Gets the [subscription](Subscription.md) associated with this message. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) MessageId**
: Gets the message Id set by the broker. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) ACK**
: Unique ID set by the broker that the client will send back as while performing a [SendACK](#void-sendacktransaction) or [SendNACK](#void-sendnacktransaction) call. 
	!!! note ""
		If the message is received from a subscription that requires explicit acknowledgment (either client or client-individual mode) then the MESSAGE frame MUST also contain an ack header with an arbitrary value.  This header will be used to relate the message to a subsequent ACK or NACK frame. 

### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) ContentType**
: Gets the content type header set by the original sender. 
### **[BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md) Content**
: Gets the content bytes sent by the original sender. 
### **[Dictionary](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.Dictionary-2)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; Headers**
: Gets all the headers received from the broker. 
## **Methods**:

### Void SendACK([Transaction](Transaction.md))
: Send back to the broker an acknowledgment(ACK) frame to acknowledge that the message is received and processed. 
	!!! note ""
		It can accept a [Transaction](Transaction.md) instance if it's in a scope of a transaction.


### Void SendNACK([Transaction](Transaction.md))
: Send back to the broker a non-acknowledgment(NACK) frame if the message couldn't process it for any reason. 
	!!! note ""
		It can accept a [Transaction](Transaction.md) instance if it's in a scope of a transaction.
