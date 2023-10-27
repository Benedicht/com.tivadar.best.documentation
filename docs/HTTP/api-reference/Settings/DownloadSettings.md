---
comments: true
---
# DownloadSettings

Represents settings for configuring an HTTP request's download behavior. 

## **Fields**:
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) ContentStreamMaxBuffered**
: Gets or sets the maximum number of bytes the [DownloadContentStream](../Response/DownloadContentStream.md) will buffer before pausing the download until its buffer has free space again. 
	!!! note ""
		When the download content stream buffers data up to this specified limit, it will temporarily pause downloading until it has free space in its buffer. Increasing this value may help reduce the frequency of pauses during downloads, but it also increases memory usage. 

### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) DisableCache**
: Gets or sets a value indicating whether caching should be enabled for this request. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) CacheOnly**
: Gets or sets a value indicating whether the response's [DownloadContentStream](../Response/DownloadContentStream.md) should be populated with downloaded data or if the content should be written only to the local cache when available. 
	!!! note ""
		If set to `true` and the content isn't cacheable (e.g., it doesn't have any cache-related headers), the content will be downloaded but will be lost. 

### **[OnHeadersReceivedDelegate](OnHeadersReceivedDelegate.md) OnHeadersReceived**
: This event is called when the plugin received and parsed all headers. 
### **[OnCreateDownloadStreamDelegate](OnCreateDownloadStreamDelegate.md) DownloadStreamFactory**
: Represents a function that creates a new [DownloadContentStream](../Response/DownloadContentStream.md) object when needed for downloading content. 
### **[OnDownloadStartedDelegate](OnDownloadStartedDelegate.md) OnDownloadStarted**
: Event for handling the start of the download process for 2xx status code responses. 
	!!! note ""
		This event is called when the plugin expects the server to send content. When called, the [DownloadContentStream](../Response/DownloadContentStream.md) might already be populated with some content. It is specifically meant for responses with 2xx status codes. 

### **[OnProgressDelegate](OnProgressDelegate.md) OnDownloadProgress**
: Gets or sets the event that is called when new data is downloaded from the server. 
	!!! note ""
		The first parameter is the original [HTTPRequest](../HTTP/HTTPRequest.md) object itself, the second parameter is the downloaded bytes, and the third parameter is the content length. There are download modes where we can't figure out the exact length of the final content. In these cases, we guarantee that the third parameter will be at least the size of the second one. 

### **[OnUpgradedDelegate](OnUpgradedDelegate.md) OnUpgraded**
: Called when a response with status code 101 (upgrade), "`connection: upgrade`" header and value or an "`upgrade`" header received. 
	!!! note ""
		This callback might be called on a thread other than the main one!
