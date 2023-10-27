---
comments: true
---
# HostKey

The [HostKey]() struct represents a unique key for identifying hosts based on their [Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) and [ProxySettings](../Settings/ProxySettings.md). 

**Remarks:**

The [HostKey]() struct is designed to uniquely identify a host based on its URI (Uniform Resource Identifier) and optional proxy settings. It provides a way to create, compare, and hash host keys, enabling efficient host variant management in the [HostManager](HostManager.md). 

 Key features of the [HostKey]() struct include: 

- **Uniqueness**:  Each [HostKey]() is guaranteed to be unique for a specific host, considering both the URI and proxy settings. 
- **Hashing**:  The struct provides a method to calculate a hash code for a [HostKey](), making it suitable for use as a dictionary key. 
- **Creation**:  You can create a [HostKey]() instance from a [Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) and optional [ProxySettings](../Settings/ProxySettings.md). 



 Usage of the [HostKey]() struct is typically handled internally by the BestHTTP library to manage unique hosts and optimize resource usage. Developers can use it when dealing with host-specific operations or customization of the library's behavior. 

## **Fields**:
### **[Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) Uri**
: Gets the URI (Uniform Resource Identifier) associated with the host. 
### **[ProxySettings](../Settings/ProxySettings.md) Proxy**
: Gets the proxy settings associated with the host. 
### **[Hash128](https://docs.unity3d.com/ScriptReference/Hash128.html) Key**
: Gets the unique hash key for the host. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Host**
: Gets the host name from the URI or "file" if the URI is a file URI. 
## **Methods**:

### [HostKey]() HostKey.From([HTTPRequest](../HTTP/HTTPRequest.md))
: Creates a [HostKey]() instance from an HTTP request. 

### [HostKey]() HostKey.From([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri), [ProxySettings](../Settings/ProxySettings.md))
: Creates a [HostKey]() instance from a URI and proxy settings. 