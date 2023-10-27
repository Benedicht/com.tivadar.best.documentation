---
comments: true
---
# TLSSecurity

A static class responsible for handling TLS security operations including setup, unloading databases, and waiting for the setup to finish. 

**Remarks:**

The class manages Root CAs, Intermediate Certificates, Client Certificates, and provides functionality for the setup process.  

## **Fields**:
### **X509Database `#!cs TLSSecurity.trustedRootCertificates`**
: Database of Root CAs that trusted by the client. 
### **X509Database `#!cs TLSSecurity.trustedIntermediateCertificates`**
: Database of Intermediate Certificates that trusted by the client. 
### **ClientCredentialDatabase `#!cs TLSSecurity.ClientCredentials`**
: Database of Client Certificates that's available to send when the server requests it. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs TLSSecurity.IsSetupCalled`**
: True if Setup already called. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs TLSSecurity.IsSetupFinished`**
: True if setup process finished successfully. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action) `#!cs TLSSecurity.OnSetupFinished`**
: Called when all databases are in place and loaded. 
## **Methods**:

### **Setup**
: Initiates the setup process of the TLS Security package. 

### **UnloadDatabases**
: Unloads all databases (certificates and OCSP cache). 

### **WaitForSetupFinish**
: Blocks the current thread until setup is finished. 