# HTTPRequestStates

Possible logical states of a HTTTPRequest object. 

## **Fields**:
### **Initial**
: Initial status of a request. No callback will be called with this status. 
### **Queued**
: The request queued for processing. 
### **Processing**
: Processing of the request started. In this state the client will send the request, and parse the response. No callback will be called with this status. 
### **Finished**
: The request finished without problem. Parsing the response done, the result can be used. The user defined callback will be called with a valid response object. The request’s Exception property will be null. 
### **Error**
: The request finished with an unexpected error. The user defined callback will be called with a null response object. The request's Exception property may contain more info about the error, but it can be null. 
### **Aborted**
: The request aborted by the client(HTTPRequest’s Abort() function). The user defined callback will be called with a null response. The request’s Exception property will be null. 
### **ConnectionTimedOut**
: Connecting to the server timed out. The user defined callback will be called with a null response. The request’s Exception property will be null. 
### **TimedOut**
: The request didn't finished in the given time. The user defined callback will be called with a null response. The request’s Exception property will be null. 