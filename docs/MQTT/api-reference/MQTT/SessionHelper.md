---
comments: true
---
# SessionHelper

Helper class to manage sessions. 


## **Methods**:

### [Session](Session.md) SessionHelper.CreateNullSession([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Creates and returns with a Null session. 

### [IEnumerable](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.IEnumerable-1)&lt;[Session](Session.md)&gt; SessionHelper.GetSessions([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Returns with all the current sessions. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) SessionHelper.HasAny([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Returns true if there's at least one stored session for the given host. 

### [Session](Session.md) SessionHelper.Get([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Loads the session with the matching clientId, or creates a new one with this id. 

### Void SessionHelper.Delete([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [Session](Session.md))
: Delete session from the store and all of its related files. 