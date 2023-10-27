---
comments: true
---
# HTTPCacheContentWriter

Represents a writer for caching HTTP response content. 

## **Fields**:
### **[HTTPCache](HTTPCache.md) Cache**
: Gets the parent HTTPCache instance associated with this content writer. 
### **[Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html) Hash**
: Hash identifying the resource. If [Write](#void-writebuffersegment) fails, it becomes an invalid one. 
### **[UInt64](https://learn.microsoft.com/en-us/dotnet/api/System.UInt64) ExpectedLength**
: Expected length of the content. Has a non-zero value only when the server is sending a "content-length" header. 
### **[UInt64](https://learn.microsoft.com/en-us/dotnet/api/System.UInt64) ProcessedLength**
: Number of bytes written to the cache. 
### **[LoggingContext](../Logger/LoggingContext.md) Context**
: Context of this cache writer used for logging. 
## **Methods**:

### Void Write([BufferSegment](../Memory/BufferSegment.md))
: Writes content to the underlying stream.  