---
comments: true
---
# Digest

Internal class that stores all information that received from a server in a WWW-Authenticate and need to construct a valid Authorization header. Based on rfc 2617 (http://tools.ietf.org/html/rfc2617). Used only internally by the plugin. 

## **Fields**:
### **[Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) Uri**
: The Uri that this Digest is bound to. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Realm**
: A string to be displayed to users so they know which username and password to use. This string should contain at least the name of the host performing the authentication and might additionally indicate the collection of users who might have access. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) Stale**
: A flag, indicating that the previous request from the client was rejected because the nonce value was stale. If stale is TRUE (case-insensitive), the client may wish to simply retry the request with a new encrypted response, without  the user for a new username and password. The server should only set stale to TRUE if it receives a request for which the nonce is invalid but with a valid digest for that nonce (indicating that the client knows the correct username/password). If stale is FALSE, or anything other than TRUE, or the stale directive is not present, the username and/or password are invalid, and new values must be obtained. 
### **[List](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List-1)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; ProtectedUris**
: List of URIs, as specified in RFC XURI, that define the protection space. If a URI is an abs_path, it is relative to the canonical root URL (see section 1.2 above) of the server being accessed. An absoluteURI in this list may refer to a different server than the one being accessed. The client can use this list to determine the set of URIs for which the same authentication information may be sent: any URI that has a URI in this list as a prefix (after both have been made absolute) may be assumed to be in the same protection space. If this directive is omitted or its value is empty, the client should assume that the protection space consists of all URIs on the responding server. 
## **Methods**:

### **ParseChallange**
: Parses a WWW-Authenticate header's value to retrive all information. 

### **GenerateResponseHeader**
: Generates a string that can be set to an Authorization header. 