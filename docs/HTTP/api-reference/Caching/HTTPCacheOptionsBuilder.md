# HTTPCacheOptionsBuilder

A builder struct for constructing an instance of [HTTPCacheOptions](../Caching/HTTPCacheOptions.md) with optional configuration settings. 


## **Methods**:

### **WithMaxCacheSize**
: Sets the maximum cache size for the HTTP cache. 

### **WithDeleteOlderThen**
: Sets the maximum duration for which cached entries will be retained. By default all entities (even stalled ones) are kept cached until they are evicted to make room for new, fresh ones. 

### **Build**
: Builds and returns an instance of [HTTPCacheOptions](../Caching/HTTPCacheOptions.md)	 with the specified configuration settings. 