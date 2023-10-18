# Digest

Internal class that stores all information that received from a server in a WWW-Authenticate and need to construct a valid Authorization header. Based on rfc 2617 (http://tools.ietf.org/html/rfc2617). Used only internally by the plugin. 

## **Fields**:
### **Uri**
: The Uri that this Digest is bound to. 
### **Realm**
: A string to be displayed to users so they know which username and password to use. This string should contain at least the name of the host performing the authentication and might additionally indicate the collection of users who might have access. 
### **Stale**
: A flag, indicating that the previous request from the client was rejected because the nonce value was stale. If stale is TRUE (case-insensitive), the client may wish to simply retry the request with a new encrypted response, without  the user for a new username and password. The server should only set stale to TRUE if it receives a request for which the nonce is invalid but with a valid digest for that nonce (indicating that the client knows the correct username/password). If stale is FALSE, or anything other than TRUE, or the stale directive is not present, the username and/or password are invalid, and new values must be obtained. 
### **Nonce**
: A server-specified data string which should be uniquely generated each time a 401 response is made. Specifically, since the string is passed in the header lines as a quoted string, the double-quote character is not allowed. 
### **Opaque**
: A string of data, specified by the server, which should be returned by the client unchanged in the Authorization header of subsequent requests with URIs in the same protection space. It is recommended that this string be base64 or data. 
### **Algorithm**
: A string indicating a pair of algorithms used to produce the digest and a checksum. If this is not present it is assumed to be "MD5". If the algorithm is not understood, the challenge should be ignored (and a different one used, if there is more than one). 
### **ProtectedUris**
: List of URIs, as specified in RFC XURI, that define the protection space. If a URI is an abs_path, it is relative to the canonical root URL (see section 1.2 above) of the server being accessed. An absoluteURI in this list may refer to a different server than the one being accessed. The client can use this list to determine the set of URIs for which the same authentication information may be sent: any URI that has a URI in this list as a prefix (after both have been made absolute) may be assumed to be in the same protection space. If this directive is omitted or its value is empty, the client should assume that the protection space consists of all URIs on the responding server. 
### **QualityOfProtections**
: If present, it is a quoted string of one or more tokens indicating the "quality of protection" values supported by the server. The value "auth" indicates authentication. The value "auth-int" indicates authentication with integrity protection. 
### **NonceCount**
: his MUST be specified if a qop directive is sent (see above), and MUST NOT be specified if the server did not send a qop directive in the WWW-Authenticate header field. The nc-value is the hexadecimal count of the number of requests (including the current request) that the client has sent with the nonce value in this request. 
### **HA1Sess**
: Used to store the last HA1 that can be used in the next header generation when Algorithm is set to "md5-sess". 
## **Methods**:

### **ParseChallange**
: Parses a WWW-Authenticate header's value to retrive all information. 

### **GenerateResponseHeader**
: Generates a string that can be set to an Authorization header. 