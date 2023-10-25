---
comments: true
---
# OCSPOptions

Represents the configuration options for handling OCSP (Online Certificate Status Protocol) operations. 

**Remarks:**

The OCSPOptions class provides settings that dictate behavior for: 

- Sending OCSP requests for certificate revocation checks.
- Thresholds for lifespan to determine revocation checks.
- Handling scenarios with unknown revocation statuses.
- Ensuring server compliance with the must-staple flag.
- Configurations related to caching OCSP responses.

 The class enables granular control over OCSP operations, ensuring that applications can fine-tune their security and performance behaviors  with regard to certificate revocation checks. 

## **Fields**:
### **EnableOCSPQueries**
: Enable or disable sending out OCSP requests for revocation checking. 
### **ShortLifeSpanThreshold**
: The plugin not going to check revocation status for short lifespan certificates. 
### **FailHard**
: Treat unknown revocation statuses (unknown OCSP status or unreachable servers) as revoked and abort the TLS negotiation. 
### **FailOnMissingCertStatusWhenMustStaplePresent**
: Treat the TLS connection failed if the leaf certificate has the must-staple flag, but the server doesn't send certificate status. 
### **OCSPCache**
: OCSP Cache Options 