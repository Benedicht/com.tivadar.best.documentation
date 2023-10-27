---
comments: true
---
# UploadSettings

Options for sending the request headers and content, including upload progress monitoring. 

**Remarks:**

[SetupRequest](#void-setuprequesthttprequest,-boolean) might be called when redirected or retried!

## **Fields**:
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) UploadChunkSize**
: Size of the internal buffer, and upload progress will be fired when this size of data sent to the wire. Its default value is 4 KiB. 
### **[Stream](https://learn.microsoft.com/en-us/dotnet/api/System.IO.Stream) UploadStream**
: The stream that the plugin will use to send data to the server. 
	!!! note ""
		The stream can be any regular [Stream](https://learn.microsoft.com/en-us/dotnet/api/System.IO.Stream) implementation or a specialized one inheriting from [UploadStreamBase](../Upload/UploadStreamBase.md): 

		- A specialized [UploadStreamBase](../Upload/UploadStreamBase.md) for data generated on-the-fly or periodically. The request remains active until the [Complete](../Upload/DynamicUploadStream.md#void-complete) method is invoked, ensuring continuous data feed even during temporary empty states.
		- An [UploadStreamBase](../Upload/UploadStreamBase.md) implementation to convert and upload the object as JSON data. It sets the `"Content-Type"` header to `"application/json; charset=utf-8"`.
		- An [UploadStreamBase](../Upload/UploadStreamBase.md) implementation representing a stream that prepares and sends data as URL-encoded form data in an HTTP request.
		- An [UploadStreamBase](../Upload/UploadStreamBase.md) based implementation of the `multipart/form-data` Content-Type. It's very memory-effective, streams are read into memory in chunks.



### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) DisposeStream**
: Set to `false` if the plugin MUST NOT dispose [UploadStream](#stream-uploadstream) after the request is finished. 
### **[OnProgressDelegate](OnProgressDelegate.md) OnUploadProgress**
: Called periodically when data sent to the server. 
### **[OnHeadersSentDelegate](OnHeadersSentDelegate.md) OnHeadersSent**
: This event is fired after the headers are sent to the server. 
## **Methods**:

### Void SetupRequest([HTTPRequest](../HTTP/HTTPRequest.md), [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean))
: Called every time the request is sent out (redirected or retried). 

### Void Dispose()
: Dispose of resources used by the UploadSettings instance. 