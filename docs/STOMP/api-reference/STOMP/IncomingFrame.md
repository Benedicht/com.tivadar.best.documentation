---
comments: true
---
# IncomingFrame

Represents an incoming frame from the STOMP server. Contains details about the frame type, headers, body, content type, and other relevant information. 

## **Fields**:
### **[ServerFrameTypes](ServerFrameTypes.md) Type**
: Gets the type of the frame. 
### **[Dictionary](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.Dictionary-2)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; Headers**
: Gets the headers associated with the frame. 
### **[BufferSegment](../../../HTTP/api-reference/Memory/BufferSegment.md) Body**
: Gets the body of the frame as a buffer segment. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) ContentType**
: Gets the content type of the frame. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Receipt**
: Gets the receipt identifier associated with the frame, if any. 