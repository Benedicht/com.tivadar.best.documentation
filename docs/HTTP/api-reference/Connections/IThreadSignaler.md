---
comments: true
---
# IThreadSignaler

Interface for signaling upload threads. 

## **Fields**:
### **[LoggingContext](../Logger/LoggingContext.md) Context**
: A [LoggingContext](../Logger/LoggingContext.md) instance for debugging purposes. 
	!!! note ""
		To help [UploadStreamBase](../Upload/UploadStreamBase.md) implementors log in the IThreadSignaler's context, the interface implementors must make their logging context accessible. 

## **Methods**:

### **SignalThread**
: Signals the associated thread to resume or wake up. 