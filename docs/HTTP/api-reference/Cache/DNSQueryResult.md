---
comments: true
---
# DNSQueryResult

Represents the result of a DNS query, including the original host name, resolved IP addresses, and any error. 

## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) HostName**
: The host name used in the DNS query. 
### **DNSIPAddress[] Addresses**
: The resolved IP addresses associated with the host name. 
### **[Exception](https://learn.microsoft.com/en-us/dotnet/api/System.Exception) Error**
: Any error that occurred during the DNS query. 