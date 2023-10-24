---
comments: true
---
# BlockingDownloadContentStream

A blocking variant of the [DownloadContentStream](../Response/DownloadContentStream.md) that allows clients to wait for downloaded data when the buffer is empty but not completed. 

**Remarks:**

The BlockingDownloadContentStream is a specialized variant of the [DownloadContentStream](../Response/DownloadContentStream.md) designed to provide a blocking mechanism for clients waiting for downloaded data. This class is particularly useful when clients need to read from the stream, but the buffer is temporarily empty due to ongoing downloads. 

 Key Features: 

- **Blocking Data Retrieval:**: Provides a blocking [Take](../Response/BlockingDownloadContentStream.md#take) method that allows clients to wait for data if the buffer is empty but not yet completed.
- **Timeout Support:**: The [Take](../Response/BlockingDownloadContentStream.md#take) method accepts a timeout parameter, allowing clients to set a maximum wait time for data availability.
- **Exception Handling:**: Handles exceptions and errors that occur during download, ensuring that clients receive any relevant exception information.



 Clients can use the [Take](../Response/BlockingDownloadContentStream.md#take) method to retrieve data from the stream, and if the buffer is empty, the method will block until new data is downloaded or a timeout occurs. This blocking behavior is particularly useful in scenarios where clients need to consume data sequentially but can't proceed until data is available. 

 When the download is completed or if an error occurs during download, this stream allows clients to inspect the completion status and any associated exceptions, just like the base [DownloadContentStream](../Response/DownloadContentStream.md). 


## **Methods**:

### **TryTake**
: Attempts to retrieve a downloaded content-segment from the stream, blocking if necessary until a segment is available. 
	!!! note ""
		The TryTake function provides a blocking approach to retrieve data from the stream. If the stream has data available, it immediately returns the data. If there's no data available, the method will block until new data is downloaded or the buffer is marked as completed. 

				 This method is designed for scenarios where clients need to read from the stream sequentially and are willing to wait until data is available. It ensures that clients receive data as soon as it becomes available, without having to repeatedly check or poll the stream. 


### **Take**
: Returns with a download content-segment. If the stream is currently empty but not completed the execution is blocked until new data downloaded. A segment is an arbitrary length array of bytes the plugin could read in one operation, it can range from couple of bytes to kilobytes. 

### **Take**
: Returns with a download content-segment. If the stream is currently empty but not completed the execution is blocked until new data downloaded or the timeout is reached. A segment is an arbitrary length array of bytes the plugin could read in one operation, it can range from couple of bytes to kilobytes. 

### **Read**
: Reads a sequence of bytes from the current stream and advances the position within the stream by the number of bytes read. 
	!!! note ""
		This override of the [Read](../Response/BlockingDownloadContentStream.md#read) method provides blocking behavior, meaning if there are no bytes available in the stream, the method will block until new data is downloaded or until the stream completes. Once data is available, or if the stream completes, the method will return with the number of bytes read. 

				 This behavior ensures that consumers of the stream can continue reading data sequentially, even if the stream's internal buffer is temporarily empty due to ongoing downloads. 
