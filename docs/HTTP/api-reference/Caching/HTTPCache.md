# HTTPCache

Manages caching of HTTP responses and associated metadata. 

**Remarks**:

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
### **RootFolderName**
: Constants defining folder and file names used in the HTTP cache storage. 
### **CacheHostName**
: This is the reversed domain the plugin uses for file paths when it have to load content from the local cache. 
### **OnCacheSizeChanged**
: Event that is triggered when the size of the cache changes. 
### **Options**
: Gets the options that define the behavior of the HTTP cache. 
### **CacheSize**
: Gets the current size of the HTTP cache in bytes. 
### **OnBeforeBeginCache**
: Called before the plugin calls [BeginCache](../Caching/HTTPCache.md#BeginCache)	 to decide whether the content will be cached or not. 
## **Methods**:

### **#ctor**
: Initializes a new instance of the HTTPCache class with the specified cache options. 

### **CalculateHash**
: Calculates a unique hash identifier based on the HTTP method and URI. 

### **GetHashDirectory**
: Generates the directory path based on the given hash where cached content is stored. 

### **GetHeaderPathFromHash**
: Generates the file path for the header cache associated with the given hash. 

### **GetContentPathFromHash**
: Generates the file path for the content cache associated with the given hash. 

### **AreCacheFilesExists**
: Checks whether cache files (header and content) associated with the given hash exist. 

### **SetupValidationHeaders**
: Sets up validation headers on an HTTP request if a locally cached response exists. 

### **IsThereEnoughSpaceAfterMaintain**
: If necessary tries to make enough space in the cache by calling Maintain. 

### **BeginCache**
: Initiates the caching process for an HTTP response, creating an [HTTPCacheContentWriter](../Caching/HTTPCacheContentWriter.md)	 if caching is enabled and all predconditions are met. 

### **EndCache**
: Finalizes the caching process and takes appropriate actions based on the completion status. 

### **BeginReadContent**
: Initiates the process of reading cached content associated with a given hash. Call BeginReadContent to acquire a Stream object that points to the cached resource. 

### **EndReadContent**
: Finalizes the process of reading cached content associated with a given hash. 

### **Delete**
: Deletes a cached entry identified by the given hash, including its associated header and content files. 

### **RefreshHeaders**
: Refreshes the headers of a cached HTTP response with new headers. 

### **CanServeWithoutValidation**
: Checks whether the caches resource identified by the hash is can be served from the local store with the given error conditions.  
	!!! note ""
		This check reflects the very current state, even if it returns 		, a request might just executing to get a write lock on it to refresh the content.


### **Redirect**
: Redirects a request to a cached entity. 

### **Clear**
: Clears the HTTP cache by removing all cached entries and associated metadata. 