---
comments: true
---
# SecurityOptions

Provides centralized security settings and configuration options related to certificate management,  OCSP (Online Certificate Status Protocol) operations, and other file and folder settings. The  SecurityOptions class consolidates options for determining how the plugin interacts  with server-sent certificates, OCSP operations, and databases for trusted certificate authorities and credentials. 

**Remarks:**

This class centralizes various security settings, allowing developers to easily configure and fine-tune  security behaviors in the application, ensuring optimal balance between security, compatibility, and performance. 

## **Fields**:
### **UseServerSentIntermediateCertificates**
: If false, only certificates stored in the trusted intermediates database are used to reconstruct the certificate chain.  When set to `true` (default), it improves compatibility but the plugin going to use/accept certificates that not stored in its trusted database. 
### **FolderAndFileOptions**
: Folder, file and extension options. 
### **OCSP**
: OCSP and OCSP cache options. 
### **TrustedRootsOptions**
: Database options of the Trusted CAs database 
### **TrustedIntermediatesOptions**
: Database options of the Trusted Intermediate Certifications database 
### **ClientCredentialsOptions**
: Database options of the Client Credentials database 