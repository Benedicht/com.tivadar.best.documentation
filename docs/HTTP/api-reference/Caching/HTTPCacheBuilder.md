---
comments: true
---
# HTTPCacheBuilder

A builder struct for constructing an instance of the HTTPCache class with optional configuration options and callbacks. 


## **Methods**:

### [HTTPCacheBuilder]() WithOptions([HTTPCacheOptions](HTTPCacheOptions.md))
: Sets the configuration options for the HTTP cache. 

### [HTTPCacheBuilder]() WithOptions([HTTPCacheOptionsBuilder](HTTPCacheOptionsBuilder.md))
: Sets the configuration options for the HTTP cache using an [HTTPCacheOptionsBuilder](HTTPCacheOptionsBuilder.md). 

### [HTTPCacheBuilder]() WithBeforeBeginCacheCallback([OnBeforeBeginCacheDelegate](OnBeforeBeginCacheDelegate.md))
: Sets a callback delegate to be executed before caching of an entity begins. 

### [HTTPCache](HTTPCache.md) Build()
: Builds and returns an instance of the [HTTPCache](HTTPCache.md) with the specified configuration options and callback delegate. 