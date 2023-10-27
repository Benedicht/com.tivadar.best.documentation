---
comments: true
---
# BodyLengths

Provides constants representing different, special body lengths for HTTP requests with upload streams. 

## **Fields**:
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) `#!cs BodyLengths.UnknownWithChunkedTransferEncoding`**
: The [UploadStreamBase](UploadStreamBase.md)'s length is unknown and the plugin have to send data with '`chunked`' transfer-encoding. 
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) `#!cs BodyLengths.UnknownRaw`**
: The [UploadStreamBase](UploadStreamBase.md)'s length is unknown and the plugin have to send data as-is, without any encoding. 
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) `#!cs BodyLengths.NoBody`**
: No content to send. 