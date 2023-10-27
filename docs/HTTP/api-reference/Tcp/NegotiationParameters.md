---
comments: true
---
# NegotiationParameters

Represents the parameters for a negotiation. 

## **Fields**:
### **[Proxy](../Proxies/Proxy.md) proxy**
: Optional proxy instance must be used during negotiation. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) createProxyTunel**
: Sets a value indicating whether to create a proxy tunnel. 
### **[Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) targetUri**
: Sets the target URI for negotiation. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) negotiateTLS**
: Sets a value indicating whether to negotiate TLS. 
### **[CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken) token**
: Sets the cancellation token for negotiation. 
### **[HostSettings](../Settings/HostSettings.md) hostSettings**
: Sets the [HostSettings](../Settings/HostSettings.md) that can be used during the negotiation process. 
### **[LoggingContext](../Logger/LoggingContext.md) context**
: Optional logging context for debugging purposes. 