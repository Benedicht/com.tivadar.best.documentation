---
comments: true
---
# DNSCacheOptions

Represents options for configuring the DNS cache behavior. 

## **Fields**:
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) RefreshAfter**
: The time interval after which DNS cache entries should be refreshed. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) RemoveAfter**
: The time interval after which DNS cache entries should be removed if not used. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) CancellationCheckGranularity**
: The granularity of cancellation checks for DNS queries. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) MaintenanceFrequency**
: The frequency of cache maintenance. 