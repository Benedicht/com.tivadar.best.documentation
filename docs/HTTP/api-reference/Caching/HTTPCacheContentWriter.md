# HTTPCacheContentWriter

Represents a writer for caching HTTP response content. 

## **Fields**:
### **Cache**
: Gets the parent HTTPCache instance associated with this content writer. 
### **Hash**
: Hash identifying the resource. If [Write](../Caching/HTTPCacheContentWriter.md#Write)	 fails, it becomes an invalid one. 
### **ExpectedLength**
: Expected length of the content. Has a non-zero value only when the server is sending a "content-length" header. 
### **ProcessedLength**
: Number of bytes written to the cache. 
### **Context**
: Context of this cache writer used for logging. 
### **_contentStream**
: Underlying stream the download bytes are written into. 
### **Unlocked**
: No reads or writes are happening on the cached content. 
### **Write**
: There's one writer operating on the cached content. No other writes or reads allowed while this lock is held on the content. 
### **Read**
: There's at least one read operation happening on the cached content. No writes allowed while this lock is held on the content. 
### **ReadLockCount**
: Number of readers. 
### **None**
: No special treatment required. 
### **MustRevalidate**
: Indicates whether the entity must be revalidated with the server or can be serverd directly from the cache without touching the server when the content is considered stale. 
	!!! note ""
		More details can be found here: 

		- https://www.rfc-editor.org/rfc/rfc9111.html#name-must-revalidate



### **NoCache**
: If it's true, the client always have to revalidate the cached content when it's stale. 
	!!! note ""
		More details can be found here: 

		- https://www.rfc-editor.org/rfc/rfc9111.html#name-no-cache-2



### **ETag**
: ETag of the entity. 
	!!! note ""
		More details can be found here: 

		- https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag



### **LastModified**
: LastModified date of the entity. Use ToString("r") to convert it to the format defined in RFC 1123. 
### **Expires**
: When the cache will expire. 
	!!! note ""
		More details can be found here: 

		- https://www.rfc-editor.org/rfc/rfc9111.html#name-expires



### **Age**
: The age that came with the response 
	!!! note ""
		More details can be found here: 

		- https://www.rfc-editor.org/rfc/rfc9111.html#name-age



### **MaxAge**
: Maximum how long the entry should served from the cache without revalidation. 
	!!! note ""
		More details can be found here: 

		- https://www.rfc-editor.org/rfc/rfc9111.html#name-max-age-2



### **Date**
: The Date that came with the response. 
	!!! note ""
		More details can be found here: 

		- https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Date



### **StaleWhileRevalidate**
: It's a grace period to serve staled content without revalidation. 
	!!! note ""
		More details can be found here: 

		- https://www.rfc-editor.org/rfc/rfc5861.html#section-3



### **StaleIfError**
: Allows the client to serve stale content if the server responds with an 5xx error. 
	!!! note ""
		More details can be found here: 

		- https://www.rfc-editor.org/rfc/rfc5861.html#section-4



### **Flags**
: bool values packed into one single flag. 
### **RequestTime**
: The value of the clock at the time of the request that resulted in the stored response. 
	!!! note ""
		More details can be found here: 

		- https://www.rfc-editor.org/rfc/rfc9111.html#section-4.2.3-3.8



### **ResponseTime**
: The value of the clock at the time the response was received. 
## **Methods**:

### **Write**
: Writes content to the underlying stream.  

### **Close**
: Close the underlying stream and invalidate the hash. 