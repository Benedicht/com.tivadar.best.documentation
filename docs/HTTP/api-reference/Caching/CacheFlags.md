---
comments: true
---
# CacheFlags

Possible caching flags that a `Cache-Control` header can send. 

## **Fields**:
### **CacheFlags.None**
: No special treatment required. 
### **CacheFlags.MustRevalidate**
: Indicates whether the entity must be revalidated with the server or can be serverd directly from the cache without touching the server when the content is considered stale. 
	!!! note ""
		More details can be found here: 

		- [https://www.rfc-editor.org/rfc/rfc9111.html#name-must-revalidate](https://www.rfc-editor.org/rfc/rfc9111.html#name-must-revalidate)



### **CacheFlags.NoCache**
: If it's true, the client always have to revalidate the cached content when it's stale. 
	!!! note ""
		More details can be found here: 

		- [https://www.rfc-editor.org/rfc/rfc9111.html#name-no-cache-2](https://www.rfc-editor.org/rfc/rfc9111.html#name-no-cache-2)


