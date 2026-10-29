---
comments: true
---
# TLSHandlers

Available TLS handlers. 

## **Fields**:
### **TLSHandlers.BouncyCastle**
: To use the 3rd party BouncyCastle implementation. 
### **TLSHandlers.Framework**
: To use .net's SslStream. 
### **TLSHandlers.Native**
: Uses the bundled AWS-LC library on every platform. HTTP/2 is negotiated with ALPN. 