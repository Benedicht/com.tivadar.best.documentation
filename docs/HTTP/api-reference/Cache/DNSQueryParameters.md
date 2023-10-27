---
comments: true
---
# DNSQueryParameters

Represents parameters for a DNS query, including the host name, address, cancellation token, logging context, callback, and tag. 

## **Fields**:
### **[Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html) Key**
: The hash key associated with the DNS query. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Hostname**
: The host name used in the DNS query. 
### **[Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) Address**
: The URI address used in the DNS query. 
### **[CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken) Token**
: The cancellation token used to cancel the DNS query. 
### **[LoggingContext](../Logger/LoggingContext.md) Context**
: Optional logging context. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-2)&lt;[DNSQueryParameters](), [DNSQueryResult](DNSQueryResult.md)&gt; Callback**
: The callback to be invoked upon completion of the DNS query. 
### **[Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object) Tag**
: An optional object reference associated with the DNS query. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsPrefetch**
: Indicates whether the DNS query is a prefetch query. 