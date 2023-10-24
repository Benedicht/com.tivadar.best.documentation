---
comments: true
---
# PerMessageCompression

Compression Extensions for WebSocket implementation. http://tools.ietf.org/html/rfc7692 

## **Fields**:
### **ClientNoContextTakeover**
: By including this extension parameter in an extension negotiation offer, a client informs the peer server of a hint that even if the server doesn't include the "client_no_context_takeover" extension parameter in the corresponding extension negotiation response to the offer, the client is not going to use context takeover. 
### **ServerNoContextTakeover**
: By including this extension parameter in an extension negotiation offer, a client prevents the peer server from using context takeover. 
### **ClientMaxWindowBits**
: This parameter indicates the base-2 logarithm of the LZ77 sliding window size of the client context. 
### **ServerMaxWindowBits**
: This parameter indicates the base-2 logarithm of the LZ77 sliding window size of the server context. 
### **Level**
: The compression level that the client will use to compress the frames. 
### **MinimumDataLegthToCompress**
: What minimum data length will trigger the compression. 
### **compressorOutputStream**
: Cached object to support context takeover. 
### **decompressorInputStream**
: Cached object to support context takeover. 
## **Methods**:

### **AddNegotiation**
: This will start the permessage-deflate negotiation process. 

### **Decode**
: IExtension implementation to possible decompress the data. 

### **Compress**
: A function to compress and return the data parameter with possible context takeover support (reusing the DeflateStream). 

### **Decompress**
: A function to decompress and return the data parameter with possible context takeover support (reusing the DeflateStream). 