---
comments: true
---
# CookieJar

The Cookie Jar implementation based on RFC 6265(http://tools.ietf.org/html/rfc6265). 

## **Fields**:
### **[UInt32](https://learn.microsoft.com/en-us/dotnet/api/System.UInt32) `#!cs CookieJar.MaximumSize`**
: Maximum size of the Cookie Jar in bytes. It's default value is 10485760 (10 MB). 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs CookieJar.IsSavingSupported`**
: Returns true if File apis are supported. 
### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) `#!cs CookieJar.AccessThreshold`**
: The plugin will delete cookies that are accessed this threshold ago. Its default value is 7 days. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) `#!cs CookieJar.IsSessionOverride`**
: If this property is set to `true`, then new cookies treated as session cookies and these cookies are not saved to disk. Its default value is `false`. 
## **Methods**:

### [List](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List-1)&lt;[Cookie](Cookie.md)&gt; CookieJar.Get([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri))
: Returns all Cookies that corresponds to the given Uri. 

### Void CookieJar.Set([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri), [Cookie](Cookie.md))
: Will add a new, or overwrite an old cookie if already exists. 

### Void CookieJar.Set([Cookie](Cookie.md))
: Will add a new, or overwrite an old cookie if already exists. 

### Void CookieJar.Clear()
: Deletes all cookies from the Jar. 

### Void CookieJar.Clear([TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan))
: Removes cookies that older than the given parameter. 

### Void CookieJar.Clear([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Removes cookies that matches to the given domain. 