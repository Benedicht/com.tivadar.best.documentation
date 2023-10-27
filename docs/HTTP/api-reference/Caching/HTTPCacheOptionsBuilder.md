---
comments: true
---
# HTTPCacheOptionsBuilder

A builder struct for constructing an instance of [HTTPCacheOptions](HTTPCacheOptions.md) with optional configuration settings. 


## **Methods**:

### [HTTPCacheOptionsBuilder]() WithMaxCacheSize([UInt64](https://learn.microsoft.com/en-us/dotnet/api/System.UInt64))
: Sets the maximum cache size for the HTTP cache. 

### [HTTPCacheOptionsBuilder]() WithDeleteOlderThen([TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan))
: Sets the maximum duration for which cached entries will be retained. By default all entities (even stalled ones) are kept cached until they are evicted to make room for new, fresh ones. 

### [HTTPCacheOptions](HTTPCacheOptions.md) Build()
: Builds and returns an instance of [HTTPCacheOptions](HTTPCacheOptions.md) with the specified configuration settings. 