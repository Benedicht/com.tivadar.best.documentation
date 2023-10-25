---
comments: true
---
# HTTP2Stream

Implements an HTTP/2 logical stream. 

## **Fields**:
### **HasFrameToSend**
: This flag is checked by the connection to decide whether to do a new processing-frame sending round before sleeping until new data arrives 
### **NextInteraction**
: Next interaction scheduled by the stream relative to *now*. Its default is TimeSpan.MaxValue == no interaction. 