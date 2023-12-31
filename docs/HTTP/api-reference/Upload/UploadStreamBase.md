---
comments: true
---
# UploadStreamBase

Abstract class to serve as a base for non-conventional streams used in HTTP requests. 

**Remarks:**

The return value of [Stream](https://learn.microsoft.com/en-us/dotnet/api/System.IO.Stream) is treated specially in the plugin: 

- **Less than zero(-1)**:  indicates that no data is currently available but more is expected in the future. In this case, when new data becomes available the IThreadSignaler object must be signaled.
- **Zero (0)**:  means that the stream is closed, no more data can be expected.
- Otherwise it must return with the number bytes copied to the buffer.

 A zero value to signal stream closure can follow a less than zero value. 

## **Fields**:
### **[IThreadSignaler](../Connections/IThreadSignaler.md) Signaler**
: Gets the [IThreadSignaler](../Connections/IThreadSignaler.md) object for signaling when new data is available. 
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) Length**
: Length in bytes that the stream will upload. 
	!!! note ""
		The return value of Length is treated specially in the plugin: 

		- **-2**: The stream's length is unknown and the plugin have to send data `with 'chunked' transfer-encoding`.
		- **-1**: The stream's length is unknown and the plugin have to send data `as-is, without any encoding`.
		- **0**: No content to send. The content-length header will contain zero (`0`).
		- **>0**: Length of the content is known, will be sent `as-is, without any encoding`. The content-length header will contain zero (`0`).

 Constants for the first three points can be found in [BodyLengths](BodyLengths.md). 

## **Methods**:

### Void BeforeSendHeaders([HTTPRequest](../HTTP/HTTPRequest.md))
: Called before sending out the request's headers. Perform content processing to calculate the final length if possible. In this function the implementor can set headers and other parameters to the request. 
	!!! note ""
		Typically called on a thread.


### Void BeforeSendBody([HTTPRequest](../HTTP/HTTPRequest.md), [IThreadSignaler](../Connections/IThreadSignaler.md))
: Called just before sending out the request's body, and saves the [IThreadSignaler](../Connections/IThreadSignaler.md) for signaling when new data is available. 
	!!! note ""
		Typically called on a separate thread.
