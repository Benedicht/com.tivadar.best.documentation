---
comments: true
---
# MultipartFormDataStream

An [UploadStreamBase](../Upload/UploadStreamBase.md) based implementation of the `multipart/form-data` Content-Type. It's very memory-effective, streams are read into memory in chunks. 

**Remarks:**

The return value of [Stream](https://learn.microsoft.com/en-us/dotnet/api/System.IO.Stream) is treated specially in the plugin: 

- **Less than zero(-1) value**:  indicates that no data is currently available but more is expected in the future. In this case, when new data becomes available the IThreadSignaler object must be signaled.
- **Zero (0)**:  means that the stream is closed, no more data can be expected.

 A zero value to signal stream closure can follow a less than zero value.

## **Fields**:
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) Length**
: Gets the length of this multipart/form-data stream. 
## **Methods**:

### [MultipartFormDataStream]() AddField([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Adds a textual field to the multipart/form-data stream. 

### [MultipartFormDataStream]() AddField([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Encoding](https://learn.microsoft.com/en-us/dotnet/api/System.Text.Encoding))
: Adds a textual field to the multipart/form-data stream. 

### AddField(String, Byte[])
: Adds a stream field to the multipart/form-data stream. 

### [MultipartFormDataStream]() AddStreamField([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Stream](https://learn.microsoft.com/en-us/dotnet/api/System.IO.Stream))
: Adds a stream field to the multipart/form-data stream. 

### [MultipartFormDataStream]() AddStreamField([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Stream](https://learn.microsoft.com/en-us/dotnet/api/System.IO.Stream), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Adds a stream field to the multipart/form-data stream. 

### [MultipartFormDataStream]() AddStreamField([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Stream](https://learn.microsoft.com/en-us/dotnet/api/System.IO.Stream), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Adds a stream field to the multipart/form-data stream. 

### Void BeforeSendBody([HTTPRequest](../HTTP/HTTPRequest.md), [IThreadSignaler](../Connections/IThreadSignaler.md))
: Adds the final boundary to the multipart/form-data stream before sending the request body. 

### Read(Byte[], Int32, Int32)
: Reads data from the multipart/form-data stream into the provided buffer. 