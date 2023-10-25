---
comments: true
---
# SecureTlsClient

Provides a concrete implementation for handling TLS v1.2 and v1.3 client functionalities to provide enhanced TLS client functionalities to establish and maintain a secure connection 

**Remarks:**

The SecureTlsClient class offers mechanisms to process, handle, and manage: 

- Supported protocol versions (v1.2 and v1.3).
- Client extensions.
- Signature algorithms from private keys.
- Creation of signer credentials based on provided algorithms and credentials.
- Client credentials handling for CertificateRequest.
- Server certificate validation using root and intermediate certificates from the local database.
- Domain validation for X509 certificates.

 The class relies heavily on integration with the BouncyCastle crypto library and includes a number of methods to facilitate the security aspects of the TLS protocol, from the handshaking process through to the verification of server certificates. 

