---
comments: true
---
# BufferPool

The BufferPool is a foundational element of the Best HTTP package, aiming to reduce dynamic memory allocation overheads by reusing byte arrays. The concept is elegantly simple: rather than allocating and deallocating memory for every requirement, byte arrays can be "borrowed" and "returned" within this pool. Once returned, these arrays are retained for subsequent use, minimizing repetitive memory operations. 

While the BufferPool is housed within the Best HTTP package, its benefits are not limited to just HTTP operations. All protocols and packages integrated with or built upon the Best HTTP package utilize and benefit from the BufferPool. This ensures that memory is used efficiently and performance remains optimal across all integrated components.

## **Fields**:
### **NoData**
: Represents an empty byte array that can be returned for zero-length requests. 
### **IsEnabled**
: Gets or sets a value indicating whether the buffer pooling mechanism is enabled or disabled. Disabling will also clear all stored entries. 
### **RemoveOlderThan**
: Specifies the duration after which buffer entries, once released back to the pool, are deemed old and will be considered for removal in the next maintenance cycle. 
### **RunMaintenanceEvery**
: Specifies how frequently the maintenance cycle should run to manage old buffers. 
### **MinBufferSize**
: Specifies the minimum buffer size that will be allocated. If a request is made for a size smaller than this and canBeLarger is `true`,  this size will be used. 
### **MaxBufferSize**
: Specifies the maximum size of a buffer that the system will consider storing back into the pool. 
### **MaxPoolSize**
: Specifies the maximum total size of all stored buffers. When the buffer reach this threshold, new releases will be declined. 
### **RemoveEmptyLists**
: Indicates whether to remove buffer stores that don't hold any buffers from the free list. 
### **IsDoubleReleaseCheckEnabled**
: If set to `true`, and a byte array is released back to the pool more than once, an error will be logged. 
	!!! note ""
		Error checking is expensive and has a very large overhead! Turn it on with caution!

## **Methods**:

### **Get**
: Fetches a byte array from the pool. 
	!!! note ""
		Depending on the `canBeLarger` parameter, the returned buffer may be larger than the requested size!


### **ReleaseBulk**
: Releases a list of buffer segments back to the pool in a bulk operation. 

### **ReleaseBulk**
: Releases a list of buffer segments back to the pool in a bulk operation. 

### **Release**
: Releases a byte array back to the pool. 

### **Resize**
: Resizes a byte array by returning the old one to the pool and fetching (or creating) a new one of the specified size. 

### **Clear**
: Clears all stored entries in the buffer pool instantly, releasing memory. 