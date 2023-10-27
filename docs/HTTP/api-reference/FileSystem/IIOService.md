---
comments: true
---
# IIOService

Interface for file-system abstraction. 


## **Methods**:

### Void DirectoryCreate([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Create a directory for the given path. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) DirectoryExists([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Return true if the directory exists for the given path. 

### Void DirectoryDelete([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Delete the directory. 

### [String[]](https://learn.microsoft.com/en-us/dotnet/api/System.String[]) GetFiles([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Return with the file names for the given path. 

### Void FileDelete([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Delete the file for the given path. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) FileExists([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Return true if the file exists on the given path. 

### [Stream](https://learn.microsoft.com/en-us/dotnet/api/System.IO.Stream) CreateFileStream([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [FileStreamModes](FileStreamModes.md))
: Create a stream that can read and/or write a file on the given path. 