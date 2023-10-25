---
comments: true
---
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
		Diagnostic logging is enabled when [Level](ILogger.md#level) is set to [All](Loglevels.md#all). 

## **Methods**:

### **Verbose**
: Logs a message with [All](Loglevels.md#all) level. 

### **Information**
: Logs a message with [Information](Loglevels.md#information) level. 

### **Warning**
: Logs a message with [Warning](Loglevels.md#warning) level. 

### **Error**
: Logs a message with [Error](Loglevels.md#error) level. 

### **Exception**
: Logs a message with [Exception](Loglevels.md#exception) level. 