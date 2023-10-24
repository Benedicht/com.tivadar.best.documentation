---
comments: true
---
# SessionHelper

Helper class to manage sessions. 


## **Methods**:

### **GetRootSessionsDirectory**
: Returns with the root directory of the sessions 

### **CreateNullSession**
: Creates and returns with a Null session. 

### **GetSessions**
: Returns with all the current sessions. 

### **HasAny**
: Returns true if there's at least one stored session for the given host. 

### **Get**
: Loads the session with the matching clientId, or creates a new one with this id. 

### **Delete**
: Delete session from the store and all of its related files. 