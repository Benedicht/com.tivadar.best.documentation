---
comments: true
---
# HTTPRange

Represents an HTTP range that specifies the byte range of a response content, received as an answer for a range-request. 

## **Fields**:
### **FirstBytePos**
: Gets the position of the first byte in the range that the server sent. 
### **LastBytePos**
: Gets the position of the last byte in the range that the server sent. 
### **ContentLength**
: Gets the total length of the full entity-body on the server. Returns -1 if this length is unknown or difficult to determine. 
### **IsValid**
: Gets a value indicating whether the HTTP range is valid. 