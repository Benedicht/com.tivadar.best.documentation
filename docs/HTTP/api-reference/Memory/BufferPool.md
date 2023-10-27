---
comments: true
---
# BufferPool

The BufferPool is a foundational element of the Best HTTP package, aiming to reduce dynamic memory allocation overheads by reusing byte arrays. The concept is elegantly simple: rather than allocating and deallocating memory for every requirement, byte arrays can be "borrowed" and "returned" within this pool. Once returned, these arrays are retained for subsequent use, minimizing repetitive memory operations. 

While the BufferPool is housed within the Best HTTP package, its benefits are not limited to just HTTP operations. All protocols and packages integrated with or built upon the Best HTTP package utilize and benefit from the BufferPool. This ensures that memory is used efficiently and performance remains optimal across all integrated components.

## **Fields**:
### **[Byte[]](https://learn.microsoft.com/en-us/dotnet/api/System.Byte[]) `#!cs BufferPool.NoData`**
: Represents an empty byte array that can be returned for zero-length requests. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs BufferPool.IsEnabled`**
: Gets or sets a value indicating whether the buffer pooling mechanism is enabled or disabled. Disabling will also clear all stored entries. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) `#!cs BufferPool.RemoveOlderThan`**
: Specifies the duration after which buffer entries, once released back to the pool, are deemed old and will be considered for removal in the next maintenance cycle. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) `#!cs BufferPool.RunMaintenanceEvery`**
: Specifies how frequently the maintenance cycle should run to manage old buffers. 
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) `#!cs BufferPool.MinBufferSize`**
: Specifies the minimum buffer size that will be allocated. If a request is made for a size smaller than this and canBeLarger is `true`,  this size will be used. 
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) `#!cs BufferPool.MaxBufferSize`**
: Specifies the maximum size of a buffer that the system will consider storing back into the pool. 
### **[Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64) `#!cs BufferPool.MaxPoolSize`**
: Specifies the maximum total size of all stored buffers. When the buffer reach this threshold, new releases will be declined. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs BufferPool.RemoveEmptyLists`**
: Indicates whether to remove buffer stores that don't hold any buffers from the free list. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs BufferPool.IsDoubleReleaseCheckEnabled`**
: If set to `true`, and a byte array is released back to the pool more than once, an error will be logged. 
	!!! note ""
		Error checking is expensive and has a very large overhead! Turn it on with caution!

## **Methods**:

### [Byte[]](https://learn.microsoft.com/en-us/dotnet/api/System.Byte[]) BufferPool.Get([Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64), [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean), [LoggingContext](../Logger/LoggingContext.md))
: Fetches a byte array from the pool. 
	!!! note ""
		Depending on the `canBeLarger` parameter, the returned buffer may be larger than the requested size!


### ReleaseBulk(ConcurrentQueue)
: Releases a list of buffer segments back to the pool in a bulk operation. 

### ReleaseBulk(List)
: Releases a list of buffer segments back to the pool in a bulk operation. 

### Release(Byte[])
: Releases a byte array back to the pool. 

### Resize(Byte[]@, Int32, Boolean, Boolean, LoggingContext)
: Resizes a byte array by returning the old one to the pool and fetching (or creating) a new one of the specified size. 

### Void BufferPool.Clear()
: Clears all stored entries in the buffer pool instantly, releasing memory. 