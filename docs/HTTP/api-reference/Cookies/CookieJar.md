# CookieJar

The Cookie Jar implementation based on RFC 6265(http://tools.ietf.org/html/rfc6265). 

## **Fields**:
### **MaximumSize**
: Maximum size of the Cookie Jar in bytes. It's default value is 10485760 (10 MB). 
### **IsSavingSupported**
: Returns true if File apis are supported. 
### **AccessThreshold**
: The plugin will delete cookies that are accessed this threshold ago. Its default value is 7 days. 
### **IsSessionOverride**
: If this property is set to 	, then new cookies treated as session cookies and these cookies are not saved to disk. Its default value is 	. 
### **Cookies**
: List of the Cookies 
### **rwLock**
: Synchronization object for thread safety. 
## **Methods**:

### **SetFromRequest**
: Will set or update all cookies from the response object. 

### **Maintain**
: Deletes all expired or 'old' cookies, and will keep the sum size of cookies under the given size. 

### **Persist**
: Saves the Cookie Jar to a file. 
	!!! note ""
		Not implemented under Unity WebPlayer


### **Load**
: Load previously persisted cookie library from the file. 

### **Get**
: Returns all Cookies that corresponds to the given Uri. 

### **Set**
: Will add a new, or overwrite an old cookie if already exists. 

### **Set**
: Will add a new, or overwrite an old cookie if already exists. 

### **Clear**
: Deletes all cookies from the Jar. 

### **Clear**
: Removes cookies that older than the given parameter. 

### **Clear**
: Removes cookies that matches to the given domain. 

### **Find**
: Find and return a Cookie and his index in the list. 