---
comments: true
---
# Message

Represents a single Server-Sent Event message as specified by the W3C SSE specification. This encapsulates individual data sent over an SSE connection, providing event details, payload data, and related metadata. Each message can represent actual data or comments from the server. 

## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Id**
: Represents the unique identifier for the event message, utilized to ensure message continuity in case of connection disruptions. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Event**
: Name of the event, or an empty string. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Data**
: The actual payload of the message. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) Retry**
: A reconnection time, in milliseconds. This must initially be a user-agent-defined value, probably in the region of a few seconds. 