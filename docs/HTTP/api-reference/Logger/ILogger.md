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

### Void Verbose([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [LoggingContext](LoggingContext.md))
: Logs a message with [All](Loglevels.md#loglevelsall) level. 

### Void Information([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [LoggingContext](LoggingContext.md))
: Logs a message with [Information](Loglevels.md#loglevelsinformation) level. 

### Void Warning([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [LoggingContext](LoggingContext.md))
: Logs a message with [Warning](Loglevels.md#loglevelswarning) level. 

### Void Error([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [LoggingContext](LoggingContext.md))
: Logs a message with [Error](Loglevels.md#loglevelserror) level. 

### Void Exception([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Exception](https://learn.microsoft.com/en-us/dotnet/api/System.Exception), [LoggingContext](LoggingContext.md))
: Logs a message with [Exception](Loglevels.md#loglevelsexception) level. 