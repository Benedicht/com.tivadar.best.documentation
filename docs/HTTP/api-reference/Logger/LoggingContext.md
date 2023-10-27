---
comments: true
---
# LoggingContext

Represents a logging context for categorizing and organizing log messages. 

**Remarks:**

The LoggingContext class is used to provide additional context information to log messages, allowing for better categorization and organization of log output. It can be associated with specific objects or situations to enrich log entries with context-specific data. 

## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Hash**
: Gets the unique hash value of this logging context. 
## **Methods**:

### Void Add([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64))
: Adds a `long` value to the logging context. 

### Void Add([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean))
: Adds a `bool` value to the logging context. 

### Void Add([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Adds a `string` value to the logging context. 

### Void Add([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [LoggingContext]())
: Adds a `LoggingContext` value to the logging context. 

### [String](https://learn.microsoft.com/en-us/dotnet/api/System.String) GetStringField([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Gets the `string` field with the specified name from the logging context. 

### Void Remove([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Removes a field from the logging context by its key. 

### Void ToJson([StringBuilder](https://learn.microsoft.com/en-us/dotnet/api/System.Text.StringBuilder))
: Converts the logging context and its associated fields to a JSON string representation. 
	!!! note ""
		This method serializes the logging context and its associated fields into a JSON format for structured logging purposes. The resulting JSON string represents the context and its fields, making it suitable for inclusion in log entries for better analysis and debugging. 
