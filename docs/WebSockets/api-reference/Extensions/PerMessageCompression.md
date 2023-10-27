---
comments: true
---
# PerMessageCompression

Compression Extensions for WebSocket implementation. http://tools.ietf.org/html/rfc7692 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) ClientNoContextTakeover**
: By including this extension parameter in an extension negotiation offer, a client informs the peer server of a hint that even if the server doesn't include the "client_no_context_takeover" extension parameter in the corresponding extension negotiation response to the offer, the client is not going to use context takeover. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) ServerNoContextTakeover**
: By including this extension parameter in an extension negotiation offer, a client prevents the peer server from using context takeover. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) ClientMaxWindowBits**
: This parameter indicates the base-2 logarithm of the LZ77 sliding window size of the client context. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) ServerMaxWindowBits**
: This parameter indicates the base-2 logarithm of the LZ77 sliding window size of the server context. 
### **CompressionLevel Level**
: The compression level that the client will use to compress the frames. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) MinimumDataLegthToCompress**
: What minimum data length will trigger the compression. 
## **Methods**:

### Void AddNegotiation([HTTPRequest](../../../HTTP/api-reference/HTTP/HTTPRequest.md))
: This will start the permessage-deflate negotiation process. 

### [BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md) Decode([Byte](https://learn.microsoft.com/en-us/dotnet/api/System.Byte), [BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md))
: IExtension implementation to possible decompress the data. 