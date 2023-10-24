---
comments: true
---
# Cookie

The Cookie implementation based on [RFC-6265](http://tools.ietf.org/html/rfc6265). 

## **Fields**:
### **Name**
: The name of the cookie. 
### **Value**
: The value of the cookie. 
### **Date**
: The Date when the Cookie is registered. 
### **LastAccess**
: When this Cookie last used in a request. 
### **Expires**
: The Expires attribute indicates the maximum lifetime of the cookie, represented as the date and time at which the cookie expires. The user agent is not required to retain the cookie until the specified date has passed. In fact, user agents often evict cookies due to memory pressure or privacy concerns. 
### **MaxAge**
: The Max-Age attribute indicates the maximum lifetime of the cookie, represented as the number of seconds until the cookie expires. The user agent is not required to retain the cookie for the specified duration. In fact, user agents often evict cookies due to memory pressure or privacy concerns. 
### **IsSession**
: If a cookie has neither the Max-Age nor the Expires attribute, the user agent will retain the cookie until "the current session is over". 
### **Domain**
: The Domain attribute specifies those hosts to which the cookie will be sent. For example, if the value of the Domain attribute is "example.com", the user agent will include the cookie in the Cookie header when making HTTP requests to example.com, www.example.com, and www.corp.example.com. If the server omits the Domain attribute, the user agent will return the cookie only to the origin server. 
### **Path**
: The scope of each cookie is limited to a set of paths, controlled by the Path attribute. If the server omits the Path attribute, the user agent will use the "directory" of the request-uri's path component as the default value. 
### **IsSecure**
: The Secure attribute limits the scope of the cookie to "secure" channels (where "secure" is defined by the user agent). When a cookie has the Secure attribute, the user agent will include the cookie in an HTTP request only if the request is transmitted over a secure channel (typically HTTP over Transport Layer Security (TLS)). 
### **IsHttpOnly**
: The HttpOnly attribute limits the scope of the cookie to HTTP requests. In particular, the attribute instructs the user agent to omit the cookie when providing access to cookies via "non-HTTP" APIs (such as a web browser API that exposes cookies to scripts). 
### **SameSite**
: SameSite prevents the browser from sending this cookie along with cross-site requests. The main goal is mitigate the risk of cross-origin information leakage. It also provides some protection against cross-site request forgery attacks. Possible values for the flag are lax or strict. 
	!!! note ""
		More details can be found here: 

		- [SameSite cookies explained](https://web.dev/samesite-cookies-explained/)



## **Methods**:

### **GuessSize**
: Guess the storage size of the cookie. 