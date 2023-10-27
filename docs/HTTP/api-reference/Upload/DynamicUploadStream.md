---
comments: true
---
# DynamicUploadStream

A specialized upload stream designed to handle data that's generated on-the-fly or periodically. 

**Remarks:**

This implementation is designed to handle scenarios where data may not always be immediately available for upload. The request will remain active until the [Complete](#void-complete) method is invoked, ensuring that data can continue to be fed into the stream even if it's temporarily empty during a Read operation. 

## **Fields**:
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) Length**
: Gets the length of the upload stream. 
	!!! note ""
		This implementation returns a constant value of `-1`, indicating that the length of the data to be uploaded is unknown. When the processing connection encounters this value, it should utilize chunked uploading to handle the data transfer. 

### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) BufferedLength**
: Gets the length of data currently buffered and ready for upload. 
## **Methods**:

### Void BeforeSendHeaders([HTTPRequest](../HTTP/HTTPRequest.md))
: Sets the necessary headers before sending the request. 

### Void BeforeSendBody([HTTPRequest](../HTTP/HTTPRequest.md), [IThreadSignaler](../Connections/IThreadSignaler.md))
: Prepares the stream before the request body is sent. 

### Read(Byte[], Int32, Int32)
: Reads data from the stream to be uploaded. 
	!!! note ""
		The returned value indicates the state of the stream: 

		- **-1**: More data is expected in the future, but isn't currently available. When new data is ready, the IThreadSignaler must be notified.
		- **0**: The stream has been closed and no more data will be provided.
		- Otherwise it returns with the number bytes copied to the buffer.

 Note: A zero return value can come after a -1 return, indicating a transition from waiting to completion. 


### Write(Byte[], Int32, Int32)
: Writes data to the stream, making it available for upload. 
	!!! note ""
		After writing data to the stream using this method, the connection is signaled that data is available to send. 


### Void Write([BufferSegment](../Memory/BufferSegment.md))
: Writes a segment of data to the stream, making it available for upload. 
	!!! note ""
		After writing a segment to the stream using this method, the connection is signaled that data is available to send. 


### Void Complete()
: Marks the stream as complete, signaling that no more data will be added. 
	!!! note ""
		All remaining buffered data will be sent to the server. 
