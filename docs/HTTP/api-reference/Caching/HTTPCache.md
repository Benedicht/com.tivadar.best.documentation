---
comments: true
---
# HTTPCache

Manages caching of HTTP responses and associated metadata. 

**Remarks:**

The `HTTPCache` class provides a powerful caching mechanism for HTTP responses in Unity applications.  It allows you to store and retrieve HTTP responses efficiently, reducing network requests and improving  the performance of your application. By utilizing HTTP caching, you can enhance user experience, reduce  bandwidth usage, and optimize loading times. 

 Key features: 

- **Optimal User Experience**: Users experience faster load times and smoother interactions, enhancing user satisfaction.
- **Efficient Caching**: It enables efficient caching of HTTP responses, reducing the need to fetch data from the network repeatedly.
- **Improved Performance**: Caching helps improve the performance of your Unity application by reducing latency and decreasing loading times.
- **Bandwidth Optimization**: By storing and reusing cached responses, you can minimize bandwidth usage, making your application more data-friendly.
- **Offline Access**: Cached responses allow your application to function even when the device is offline or has limited connectivity.
- **Reduced Server Load**: Fewer network requests mean less load on your server infrastructure, leading to cost savings and improved server performance.
- **Manual Cache Control**: You can also manually control caching by adding, removing, or updating cached responses.



## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) `#!cs HTTPCache.CacheHostName`**
: This is the reversed domain the plugin uses for file paths when it have to load content from the local cache. 
### **[OnCacheSizeChangedDelegate](OnCacheSizeChangedDelegate.md) OnCacheSizeChanged**
: Event that is triggered when the size of the cache changes. 
### **[HTTPCacheOptions](HTTPCacheOptions.md) Options**
: Gets the options that define the behavior of the HTTP cache. 
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) CacheSize**
: Gets the current size of the HTTP cache in bytes. 
### **[OnBeforeBeginCacheDelegate](OnBeforeBeginCacheDelegate.md) OnBeforeBeginCache**
: Called before the plugin calls [BeginCache](#begincache(httpmethods,-uri,-int32,-string,-list,-loggingcontext)) to decide whether the content will be cached or not. 
## **Methods**:

### [Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html) HTTPCache.CalculateHash([HTTPMethods](../HTTP/HTTPMethods.md), [Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri))
: Calculates a unique hash identifier based on the HTTP method and URI. 

### [String](https://learn.microsoft.com/en-us/dotnet/api/System.String) GetHashDirectory([Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html))
: Generates the directory path based on the given hash where cached content is stored. 

### [String](https://learn.microsoft.com/en-us/dotnet/api/System.String) GetHeaderPathFromHash([Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html))
: Generates the file path for the header cache associated with the given hash. 

### [String](https://learn.microsoft.com/en-us/dotnet/api/System.String) GetContentPathFromHash([Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html))
: Generates the file path for the content cache associated with the given hash. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) AreCacheFilesExists([Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html))
: Checks whether cache files (header and content) associated with the given hash exist. 

### Void SetupValidationHeaders([HTTPRequest](../HTTP/HTTPRequest.md))
: Sets up validation headers on an HTTP request if a locally cached response exists. 

### BeginCache(HTTPMethods, Uri, Int32, String, List, LoggingContext)
: Initiates the caching process for an HTTP response, creating an [HTTPCacheContentWriter](HTTPCacheContentWriter.md) if caching is enabled and all predconditions are met. 

### Void EndCache([HTTPCacheContentWriter](HTTPCacheContentWriter.md), [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean), [LoggingContext](../Logger/LoggingContext.md))
: Finalizes the caching process and takes appropriate actions based on the completion status. 

### [Stream](https://learn.microsoft.com/en-us/dotnet/api/System.IO.Stream) BeginReadContent([Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html), [LoggingContext](../Logger/LoggingContext.md))
: Initiates the process of reading cached content associated with a given hash. Call BeginReadContent to acquire a Stream object that points to the cached resource. 

### Void EndReadContent([Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html), [LoggingContext](../Logger/LoggingContext.md))
: Finalizes the process of reading cached content associated with a given hash. 

### Void Delete([Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html), [LoggingContext](../Logger/LoggingContext.md))
: Deletes a cached entry identified by the given hash, including its associated header and content files. 

### RefreshHeaders(Hash128, String, List, LoggingContext)
: Refreshes the headers of a cached HTTP response with new headers. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) CanServeWithoutValidation([Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html), [ErrorTypeForValidation](ErrorTypeForValidation.md), [LoggingContext](../Logger/LoggingContext.md))
: Checks whether the caches resource identified by the hash is can be served from the local store with the given error conditions.  
	!!! note ""
		This check reflects the very current state, even if it returns `true`, a request might just executing to get a write lock on it to refresh the content.


### Void Redirect([HTTPRequest](../HTTP/HTTPRequest.md), [Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html))
: Redirects a request to a cached entity. 

### Void Clear()
: Clears the HTTP cache by removing all cached entries and associated metadata. 