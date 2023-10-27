---
comments: true
---
# HTTP2Stream

Implements an HTTP/2 logical stream. 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) HasFrameToSend**
: This flag is checked by the connection to decide whether to do a new processing-frame sending round before sleeping until new data arrives 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) NextInteraction**
: Next interaction scheduled by the stream relative to *now*. Its default is TimeSpan.MaxValue == no interaction. 