---
comments: true
---
# StringBuilderPool

Implements pooling logic for [StringBuilder](https://learn.microsoft.com/en-us/dotnet/api/System.Text.StringBuilder) instances. 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs StringBuilderPool.IsEnabled`**
: Setting this property to false the pooling mechanism can be disabled. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) `#!cs StringBuilderPool.RemoveOlderThan`**
: Buffer entries that released back to the pool and older than this value are moved when next maintenance is triggered. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) `#!cs StringBuilderPool.RunMaintenanceEvery`**
: How often pool maintenance must run. 