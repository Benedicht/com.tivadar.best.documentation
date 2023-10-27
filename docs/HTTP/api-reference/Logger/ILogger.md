---
comments: true
---
# ILogger

Represents a logger for recording log messages. 

## **Fields**:
### **[Loglevels](Loglevels.md) Level**
: Gets or sets the minimum severity level for logging. 
### **[ILogOutput](ILogOutput.md) Output**
: Gets or sets the output target for log messages. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsDiagnostic**
: Gets a value indicating whether diagnostic logging is enabled. 
	!!! note ""
		Diagnostic logging is enabled when [Level](#loglevels-level) is set to [All](Loglevels.md#loglevelsall). 

## **Methods**:

### **Verbose**
: Logs a message with [All](Loglevels.md#loglevelsall) level. 

### **Information**
: Logs a message with [Information](Loglevels.md#loglevelsinformation) level. 

### **Warning**
: Logs a message with [Warning](Loglevels.md#loglevelswarning) level. 

### **Error**
: Logs a message with [Error](Loglevels.md#loglevelserror) level. 

### **Exception**
: Logs a message with [Exception](Loglevels.md#loglevelsexception) level. 