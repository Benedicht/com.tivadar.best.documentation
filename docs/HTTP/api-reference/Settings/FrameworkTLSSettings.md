---
comments: true
---
# FrameworkTLSSettings

Settings for .NET's SslStream based handler. 

## **Fields**:
### **[SslProtocols](https://learn.microsoft.com/en-us/dotnet/api/System.Security.Authentication.SslProtocols) TlsVersions**
: The supported TLS versions. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) CheckCertificateRevocation**
: Indicates whether to check certificate revocation. 
### **[Func](https://learn.microsoft.com/en-us/dotnet/api/System.Func-5)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [X509Certificate](https://learn.microsoft.com/en-us/dotnet/api/System.Security.Cryptography.X509Certificates.X509Certificate), [X509Chain](https://learn.microsoft.com/en-us/dotnet/api/System.Security.Cryptography.X509Certificates.X509Chain), [SslPolicyErrors](https://learn.microsoft.com/en-us/dotnet/api/System.Net.Security.SslPolicyErrors), [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean)&gt; DefaultCertificationValidator**
: The default certification validator. 
### **[ClientCertificateSelector](ClientCertificateSelector.md) ClientCertificationProvider**
: Delegate for providing a client certificate. 