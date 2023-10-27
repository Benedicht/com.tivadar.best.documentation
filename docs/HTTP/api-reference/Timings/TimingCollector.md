---
comments: true
---
# TimingCollector

Helper class to store, calculate and manage request related events and theirs duration, referenced by [Timing](../HTTP/HTTPRequest.md#timingcollector-timing) field. 

## **Fields**:
### **[DateTime](https://learn.microsoft.com/en-us/dotnet/api/System.DateTime) Created**
: When the TimingCollector instance created. 
### **[DateTime](https://learn.microsoft.com/en-us/dotnet/api/System.DateTime) Finished**
: When the closing Finish event is sent. 
### **[List](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List-1)&lt;[TimingEvent](TimingEvent.md)&gt; Events**
: List of added events. 