# HTTPCacheBuilder

A builder struct for constructing an instance of the HTTPCache class with optional configuration options and callbacks. 


## **Methods**:

### **WithOptions**
: Sets the configuration options for the HTTP cache. 

### **WithOptions**
: Sets the configuration options for the HTTP cache using an [HTTPCacheOptionsBuilder](../Caching/HTTPCacheOptionsBuilder.md). 

### **WithBeforeBeginCacheCallback**
: Sets a callback delegate to be executed before caching of an entity begins. 

### **Build**
: Builds and returns an instance of the [HTTPCache](../Caching/HTTPCache.md) with the specified configuration options and callback delegate. 