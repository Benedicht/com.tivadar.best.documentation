---
comments: true
---
# CacheMetadataContent

Cached content associated with a [CacheMetadata](../Caching/CacheMetadata.md). 

**Remarks:**

This is NOT the cached content received from the server! It's for storing caching values to decide on how the content can be used.

## **Fields**:
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