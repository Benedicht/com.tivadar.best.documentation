# ILogger

Represents a logger for recording log messages. 

## **Fields**:
### **Level**
: Gets or sets the minimum severity level for logging. 
### **Output**
: Gets or sets the output target for log messages. 
### **IsDiagnostic**
: Gets a value indicating whether diagnostic logging is enabled. 
	!!! note ""
		Diagnostic logging is enabled when the [Level](../ILogger/.md#Level)		 is set to [All](../Loglevels/.md#All)		. 

## **Methods**:

### **Verbose**
: Logs a message with [All](../Loglevels/.md#All)	 level. 

### **Information**
: Logs a message with [Information](../Loglevels/.md#Information)	 level. 

### **Warning**
: Logs a message with [Warning](../Loglevels/.md#Warning)	 level. 

### **Error**
: Logs a message with [Error](../Loglevels/.md#Error)	 level. 

### **Exception**
: Logs a message with [Exception](../Loglevels/.md#Exception)	 level. 