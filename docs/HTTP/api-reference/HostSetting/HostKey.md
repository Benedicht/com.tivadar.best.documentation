---
comments: true
---
# HostKey

The [HostKey](HostKey.md) struct represents a unique key for identifying hosts based on their **Uri** and [ProxySettings](../Settings/ProxySettings.md). 

**Remarks:**

The [HostKey](HostKey.md) struct is designed to uniquely identify a host based on its URI (Uniform Resource Identifier) and optional proxy settings. It provides a way to create, compare, and hash host keys, enabling efficient host variant management in the [HostManager](HostManager.md). 

 Key features of the [HostKey](HostKey.md) struct include: 

- **Uniqueness:**:  Each [HostKey](HostKey.md) is guaranteed to be unique for a specific host, considering both the URI and proxy settings. 
- **Hashing:**:  The struct provides a method to calculate a hash code for a [HostKey](HostKey.md), making it suitable for use as a dictionary key. 
- **Creation:**:  You can create a [HostKey](HostKey.md) instance from a **Uri** and optional [ProxySettings](../Settings/ProxySettings.md). 



 Usage of the [HostKey](HostKey.md) struct is typically handled internally by the BestHTTP library to manage unique hosts and optimize resource usage. Developers can use it when dealing with host-specific operations or customization of the library's behavior. 

## **Fields**:
### **Uri**
: Gets the URI (Uniform Resource Identifier) associated with the host. 
### **Proxy**
: Gets the proxy settings associated with the host. 
### **Key**
: Gets the unique hash key for the host. 
### **Host**
: Gets the host name from the URI or "file" if the URI is a file URI. 
## **Methods**:

### **#ctor**
: Initializes a new instance of the [HostKey](HostKey.md) struct with the specified URI and proxy settings. 

### **From**
: Creates a [HostKey](HostKey.md) instance from an HTTP request. 

### **From**
: Creates a [HostKey](HostKey.md) instance from a URI and proxy settings. 