---
comments: true
---
# IExtension

Interface for websocket-extension implementations. 


## **Methods**:

### Void AddNegotiation([HTTPRequest](../../../HTTP/api-reference/HTTP/HTTPRequest.md))
: This is the first pass: here we can add headers to the request to initiate an extension negotiation. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) ParseNegotiation([HTTPResponse](../../../HTTP/api-reference/HTTP/HTTPResponse.md))
: If the websocket upgrade succeded it will call this function to be able to parse the server's negotiation response. Inside this function the IsEnabled should be set. 

### [BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md) Decode([Byte](https://learn.microsoft.com/en-us/dotnet/api/System.Byte), [BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md))
: This function can be used the decode the server-sent data. 