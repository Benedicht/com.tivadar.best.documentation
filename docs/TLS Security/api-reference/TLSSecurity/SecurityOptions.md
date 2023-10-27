---
comments: true
---
# SecurityOptions

Provides centralized security settings and configuration options related to certificate management,  OCSP (Online Certificate Status Protocol) operations, and other file and folder settings. The  SecurityOptions class consolidates options for determining how the plugin interacts  with server-sent certificates, OCSP operations, and databases for trusted certificate authorities and credentials. 

**Remarks:**

This class centralizes various security settings, allowing developers to easily configure and fine-tune  security behaviors in the application, ensuring optimal balance between security, compatibility, and performance. 

## **Fields**:
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs SecurityOptions.UseServerSentIntermediateCertificates`**
: If false, only certificates stored in the trusted intermediates database are used to reconstruct the certificate chain.  When set to `true` (default), it improves compatibility but the plugin going to use/accept certificates that not stored in its trusted database. 
### **[FolderAndFileOptions](FolderAndFileOptions.md) `#!cs SecurityOptions.FolderAndFileOptions`**
: Folder, file and extension options. 
### **[OCSPOptions](OCSPOptions.md) `#!cs SecurityOptions.OCSP`**
: OCSP and OCSP cache options. 
### **X509DatabaseOptions `#!cs SecurityOptions.TrustedRootsOptions`**
: Database options of the Trusted CAs database 
### **X509DatabaseOptions `#!cs SecurityOptions.TrustedIntermediatesOptions`**
: Database options of the Trusted Intermediate Certifications database 
### **ClientCredentialDatabaseOptions `#!cs SecurityOptions.ClientCredentialsOptions`**
: Database options of the Client Credentials database 