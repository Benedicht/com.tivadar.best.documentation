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
		Diagnostic logging is enabled when [Level](../Logger/ILogger.md#level) is set to [All](../Logger/Loglevels.md#all). 

## **Methods**:

### **Verbose**
: Logs a message with [All](../Logger/Loglevels.md#all) level. 

### **Information**
: Logs a message with [Information](../Logger/Loglevels.md#information) level. 

### **Warning**
: Logs a message with [Warning](../Logger/Loglevels.md#warning) level. 

### **Error**
: Logs a message with [Error](../Logger/Loglevels.md#error) level. 

### **Exception**
: Logs a message with [Exception](../Logger/Loglevels.md#exception) level. 