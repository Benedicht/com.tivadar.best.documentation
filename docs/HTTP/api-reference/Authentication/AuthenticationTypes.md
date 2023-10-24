---
comments: true
---
# AuthenticationTypes

Authentication types that supported by Best.HTTP. The authentication is defined by the server, so the Basic and Digest are not interchangeable. If you don't know what to use, the preferred way is to choose Unknow. 

## **Fields**:
### **Unknown**
: If the authentication type is not known this will do a challenge turn to receive what methode should be choosen. 
### **Basic**
: The most basic authentication type. It's easy to do, and easy to crack, don't use it with plain http:// 
### **Digest**
: HTTP Digest authentication 