# IExtension

Interface for websocket-extension implementations. 


## **Methods**:

### **AddNegotiation**
: This is the first pass: here we can add headers to the request to initiate an extension negotiation. 

### **ParseNegotiation**
: If the websocket upgrade succeded it will call this function to be able to parse the server's negotiation response. Inside this function the IsEnabled should be set. 

### **Decode**
: This function can be used the decode the server-sent data. 