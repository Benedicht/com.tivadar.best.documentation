---
comments: true
---
# BodyLengths

Provides constants representing different, special body lengths for HTTP requests with upload streams. 

## **Fields**:
### **UnknownWithChunkedTransferEncoding**
: The [UploadStreamBase](UploadStreamBase.md)'s length is unknown and the plugin have to send data with '`chunked`' transfer-encoding. 
### **UnknownRaw**
: The [UploadStreamBase](UploadStreamBase.md)'s length is unknown and the plugin have to send data as-is, without any encoding. 
### **NoBody**
: No content to send. 