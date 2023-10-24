---
comments: true
---
# HTTPCacheContentWriter

Represents a writer for caching HTTP response content. 

## **Fields**:
### **Cache**
: Gets the parent HTTPCache instance associated with this content writer. 
### **Hash**
: Hash identifying the resource. If [Write](../Caching/HTTPCacheContentWriter.md#write) fails, it becomes an invalid one. 
### **ExpectedLength**
: Expected length of the content. Has a non-zero value only when the server is sending a "content-length" header. 
### **ProcessedLength**
: Number of bytes written to the cache. 
### **Context**
: Context of this cache writer used for logging. 
### **_contentStream**
: Underlying stream the download bytes are written into. 
## **Methods**:

### **Write**
: Writes content to the underlying stream.  

### **Close**
: Close the underlying stream and invalidate the hash. 