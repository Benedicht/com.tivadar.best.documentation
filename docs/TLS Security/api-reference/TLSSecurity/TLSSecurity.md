---
comments: true
---
# TLSSecurity

A static class responsible for handling TLS security operations including setup, unloading databases, and waiting for the setup to finish. 

**Remarks:**

The class manages Root CAs, Intermediate Certificates, Client Certificates, and provides functionality for the setup process.  

## **Fields**:
### **trustedRootCertificates**
: Database of Root CAs that trusted by the client. 
### **trustedIntermediateCertificates**
: Database of Intermediate Certificates that trusted by the client. 
### **ClientCredentials**
: Database of Client Certificates that's available to send when the server requests it. 
### **IsSetupCalled**
: True if Setup already called. 
### **IsSetupFinished**
: True if setup process finished successfully. 
### **OnSetupFinished**
: Called when all databases are in place and loaded. 
## **Methods**:

### **Setup**
: Initiates the setup process of the TLS Security package. 

### **UnloadDatabases**
: Unloads all databases (certificates and OCSP cache). 

### **WaitForSetupFinish**
: Blocks the current thread until setup is finished. 