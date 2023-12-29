---
comments: true
---
# MessageBuilder

Provides an interface for building and sending messages to a STOMP broker. 


## **Methods**:

### [MessageBuilder]() WithContentType([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Sets the content type for the message. 

### [MessageBuilder]() WithHeader([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Adds a custom header to the message. 

### WithAcknowledgmentCallback(Client, IncomingFrame})
: Sets a callback to be invoked upon acknowledgment of the message. 
	!!! note ""
		When the message is sent in scope of a transaction, the callback will be called ONLY when the transaction is committed!


### [MessageBuilder]() WithContent([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Sets the content of the message as a string. 
	!!! note ""
		It also sets the `Content-Type` header to `text/plain;charset=utf-8`! If a different `Content-Type` should be set, call [WithContentType](#messagebuilder-withcontenttypestring) after this call.


### WithContent(Byte[])
: Sets the content of the message as a byte array. 

### WithContent(Byte[], Int32, Int32)
: Sets the content of the message as a byte array with specified offset and count. 

### [MessageBuilder]() WithContent([BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md), [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean))
: Sets the content of the message using a [BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md). 

### [MessageBuilder]() WithTransaction([Transaction](../STOMP/Transaction.md))
: Associates the message with a [transaction](../STOMP/Transaction.md). 

### Void BeginSend()
: Begins sending the message to the broker. 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[ValueTuple](https://learn.microsoft.com/en-us/dotnet/api/System.ValueTuple-2)&lt;[Client](../STOMP/Client.md), [IncomingFrame](../STOMP/IncomingFrame.md)&gt;&gt; SendAsync()
: Begins sending the message to the broker. 