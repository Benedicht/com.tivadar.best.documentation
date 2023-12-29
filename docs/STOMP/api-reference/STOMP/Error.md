---
comments: true
---
# Error

Represents an error that occurred within the STOMP client, including details about the source and nature of the error. 

## **Fields**:
### **[ErrorSources](ErrorSources.md) Source**
: Gets the source of the error, indicating whether it originated from the server, client, or transport layer. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Message**
: Gets the message describing the error. 
### **[IncomingFrame](IncomingFrame.md) Frame**
: Gets the STOMP frame associated with the error, if the error originated from the server. 