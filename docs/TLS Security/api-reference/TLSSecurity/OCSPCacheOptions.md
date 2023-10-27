---
comments: true
---
# OCSPCacheOptions

Represents configuration options specific to OCSP caching. 

## **Fields**:
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) MaxWaitTime**
: Gets or sets the maximum wait time for OCSP responses. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) RetryUnknownAfter**
: Determines the duration after which to retry in cases of unknown OCSP statuses. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) FolderName**
: Gets or sets the folder name for OCSP caching. 
### **OCSPDatabaseOptions DatabaseOptions**
: Represents database-specific options for OCSP caching. 
### **[OCSPCacheHTTPRequestOptions](OCSPCacheHTTPRequestOptions.md) HTTPRequestOptions**
: Represents HTTP request-specific options for OCSP caching. 