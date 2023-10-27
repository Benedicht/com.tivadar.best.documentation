---
comments: true
---
# TimingEvent

Struct to hold information about one timing event recorded for a [HTTPRequest](../HTTP/HTTPRequest.md). Timing events are managed by the [TimingCollector](TimingCollector.md). 

## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Name**
: Name of the event 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) Duration**
: Duration of the event. 
### **[DateTime](https://learn.microsoft.com/en-us/dotnet/api/System.DateTime) When**
: When the event occurred. 