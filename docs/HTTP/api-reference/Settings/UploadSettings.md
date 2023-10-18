# UploadSettings

Options for sending the request headers and content, including upload progress monitoring. 

**Remarks**:

[SetupRequest](../Settings/UploadSettings.md#SetupRequest) might be called when redirected or retried!

## **Fields**:
### **UploadChunkSize**
: Size of the internal buffer, and upload progress will be fired when this size of data sent to the wire. Its default value is 4 KiB. 
### **UploadStream**
: The stream that the plugin will use to send data to the server. 
	!!! note ""
		The stream can be any regular **Stream**		 implementation or a specialized one inheriting from [UploadStreamBase](../Upload/UploadStreamBase.md)		: 

		- A specialized [UploadStreamBase](../Upload/UploadStreamBase.md) for data generated on-the-fly or periodically. The request remains active until the [Complete](../Upload/DynamicUploadStream.md#Complete) method is invoked, ensuring continuous data feed even during temporary empty states.
		- An [UploadStreamBase](../Upload/UploadStreamBase.md) implementation to convert and upload the object as JSON data. It sets the  header to .
		- An [UploadStreamBase](../Upload/UploadStreamBase.md) implementation representing a stream that prepares and sends data as URL-encoded form data in an HTTP request.
		- An [UploadStreamBase](../Upload/UploadStreamBase.md) based implementation of the  Content-Type. It's very memory-effective, streams are read into memory in chunks.



### **DisposeStream**
: Set to 	 if the plugin MUST NOT dispose [UploadStream](../UploadSettings/.md#UploadStream)	 after the request is finished. 
### **OnUploadProgress**
: Called periodically when data sent to the server. 
### **isDisposed**
: Whether to send an "	" header and value when there's content to send ([UploadStream](../UploadSettings/.md#UploadStream)	 != 	). By using "	" the server is able to respond with an error (like 	, 	, etc.) or redirect before the client sends the whole payload. 
	!!! note ""
		More details can be found here: 

		- [RFC-9110 - Expect header](https://www.rfc-editor.org/rfc/rfc9110#name-expect)
		- [EXPECT: TWEAKS IN CURL (by Daniel Stenberg)](https://daniel.haxx.se/blog/2020/02/27/expect-tweaks-in-curl/)



### **Created**
: When the TimingCollector instance created. 
### **Finished**
: When the closing Finish event is sent. 
### **Events**
: List of added events. 
### **Name**
: Name of the event 
### **Duration**
: Duration of the event. 
### **When**
: When the event occurred. 
## **Methods**:

### ****
: This event is fired after the headers are sent to the server. 

### **SetupRequest**
: Called every time the request is sent out (redirected or retried). 

### **Dispose**
: Dispose of resources used by the UploadSettings instance. 

### **Finish**
: Finish the last event. 

### **Abort**
: Abort the currently running event. 

### **AddEvent**
: When the event happened and for how long. 