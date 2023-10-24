---
comments: true
---
# DownloadContentStream

A read-only stream that the plugin uses to store the downloaded content. This stream is designed to buffer downloaded data efficiently and provide it to consumers. 

**Remarks:**

The DownloadContentStream serves as a storage medium for content downloaded during HTTP requests. It buffers the downloaded data in segments and allows clients to read from the buffer as needed. This buffering mechanism is essential for optimizing download performance, especially in scenarios where the download rate may vary or be faster than the rate at which data is consumed. 

 The stream operates in conjunction with the [IDownloadContentBufferAvailable](../Connections/IDownloadContentBufferAvailable.md) interface, which is used to signal connections when buffer space becomes available. Connections can then transfer additional data into the buffer for processing. 



- **Efficient Buffering:**: The stream efficiently buffers downloaded content, ensuring that data is readily available for reading without extensive delays.
- **Dynamic Resizing:**: The internal buffer dynamically resizes to accommodate varying amounts of downloaded data, optimizing memory usage.
- **Asynchronous Signal Handling:**: Asynchronous signaling mechanisms are used to notify connections when buffer space is available, enabling efficient data transfer.
- **Error Handling:**: The stream captures and propagates errors that occur during download, allowing clients to handle exceptions gracefully.
- **Blocking Variant:**: A blocking variant, [BlockingDownloadContentStream](../Response/BlockingDownloadContentStream.md), allows clients to wait for data when the buffer is empty but not completed.



 Clients can read from this stream using standard stream reading methods, and the stream will release memory segments as data is read. When the download is completed or if an error occurs during download, this stream allows clients to inspect the completion status and any associated exceptions. 

## **Fields**:
### **Response**
: Gets the HTTP response from which this download stream originated. 
### **IsCompleted**
: Gets a value indicating whether the download is completed, and there's no more data buffered in the stream to read. 
### **CompletedWith**
: Gets a reference to an exception if the download completed with an error. 
### **Length**
: Gets the length of the buffered data. Because downloads happen in parallel, a [Read](../Response/DownloadContentStream.md#read) call can return with more data after checking Length. 
### **MaxBuffered**
: Gets the maximum size of the internal buffer of this stream. 
	!!! note ""
		In some cases, the plugin may put more data into the stream than the specified size.

### **IsFull**
: Gets a value indicating whether the internal buffer holds at least the [MaxBuffered](../Response/DownloadContentStream.md#maxbuffered) amount of data. 
### **IsDetached**
: Gets or sets whether the stream is detached from the [HTTPRequest](../HTTP/HTTPRequest.md)/[HTTPResponse](../HTTP/HTTPResponse.md) when [Read](../Response/DownloadContentStream.md#read) is used before the request is finished. When the stream is detached from the response object, their lifetimes are not bound together, meaning that the stream isn't disposed automatically, and the client code is responsible for calling the stream's **Stream.Dispose** function. 
### **_isFullCheckCount**
: Count of consecutive calls with DoFullCheck that found the stream fully buffered. 
## **Methods**:

### **EmergencyIncreaseMaxBuffered**
: There are cases where the plugin have to put more data into the buffer than its previously set maximum. For example when the underlying connection is closed, but the content provider still have buffered data, in witch case we have to push all processed data to the user facing download stream. 

### **CompleteAdding**
: Completes the download stream with an optional error. Called when the download is finished. 

### **TryTake**
: Tries to remove a downloaded segment from the stream. If the stream is empty, it returns immediately with false. 

### **Read**
: A non-blocking Read function. When it returns `0`, it doesn't mean the download is complete. If the download interrupted before completing, the next Read call can throw an exception. 

### **Write**
: Writes a downloaded data segment to the stream. 

### **DoFullCheck**
: Checks whether the stream is fully buffered and increases a counter if it's full, resetting it otherwise. 

### **Dispose**
: Disposes of the stream, releasing any resources held by it. 