---
comments: true
---
# HTTPResponse

Represents an HTTP response received from a remote server, containing information about the response status, headers, and data. 

**Remarks:**

The HTTPResponse class represents an HTTP response received from a remote server. It contains information about the response status, headers, and the data content. 

 Key Features: 

- **Response Properties**: Provides access to various properties such as [HTTPVersion](#version-httpversion), [StatusCode](#int32-statuscode), [Message](#string-message), and more, to inspect the response details.
- **Data Access**: Allows access to the response data in various forms, including raw bytes, UTF-8 text, and as a [Texture2D](https://docs.unity3d.com/ScriptReference/Texture2D.html) for image data.
- **Header Management**: Provides methods to add, retrieve, and manipulate HTTP headers associated with the response, making it easy to inspect and work with header information.
- **Caching Support**: Supports response caching, enabling the storage of downloaded data in local cache storage for future use.
- **Stream Management**: Manages the download process and data streaming through a [DownloadContentStream](../Response/DownloadContentStream.md) ([DownStream](#downloadcontentstream-downstream)) to optimize memory usage and ensure efficient handling of large response bodies.



## **Fields**:
### **[Version](https://learn.microsoft.com/en-us/dotnet/api/System.Version) HTTPVersion**
: Gets the version of the HTTP protocol with which the response was received. Typically, this is HTTP/1.1 for local file and cache responses, even if the original response received with a different version. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) StatusCode**
: Gets the HTTP status code sent from the server, indicating the outcome of the HTTP request. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Message**
: Gets the message sent along with the status code from the server. This message can add some details, but it's empty for HTTP/2 responses. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsSuccess**
: Gets a value indicating whether the response represents a successful HTTP request. Returns true if the status code is in the range of [200..300[ or 304 (Not Modified). 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsFromCache**
: Gets a value indicating whether the response body is read from the cache. 
### **[Dictionary](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.Dictionary-2)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [List](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List-1)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt;&gt; Headers**
: Gets the headers sent from the server as key-value pairs. You can use additional methods to manage and retrieve header information. 
	!!! note ""
		The Headers property provides access to the headers sent by the server in the HTTP response. You can use the following methods to work with headers: 

		- Adds an HTTP header with the specified name and value to the response headers.
		- Retrieves the list of values for a given header name as received from the server.
		- Retrieves the first value for a given header name as received from the server.
		- Checks if a header with the specified name and value exists in the response headers.
		- Checks if a header with the specified name exists in the response headers.
		- Parses the 'Content-Range' header's value and returns a [HTTPRange](HTTPRange.md) object representing the byte range of the response content.



### **[Byte[]](https://learn.microsoft.com/en-us/dotnet/api/System.Byte[]) Data**
: The data that downloaded from the server. All Transfer and Content encodings decoded if any(eg. chunked, gzip, deflate). 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsUpgraded**
: The normal HTTP protocol is upgraded to an other. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) DataAsText**
: The data converted to an UTF8 string. 
### **[Texture2D](https://docs.unity3d.com/ScriptReference/Texture2D.html) DataAsTexture2D**
: The data loaded to a Texture2D. 
### **[DownloadContentStream](../Response/DownloadContentStream.md) DownStream**
: Reference to the [DownloadContentStream](../Response/DownloadContentStream.md) instance that contains the downloaded data. 
### **[LoggingContext](../Logger/LoggingContext.md) Context**
: IProtocol.LoggingContext implementation. 
### **[HTTPRequest](HTTPRequest.md) Request**
: The original request that this response is created for. 
## **Methods**:

### **AddHeader**
: Adds an HTTP header with the specified name and value to the response headers. 

### **GetHeaderValues**
: Retrieves the list of values for a given header name as received from the server. 

### **GetFirstHeaderValue**
: Retrieves the first value for a given header name as received from the server. 

### **HasHeaderWithValue**
: Checks if a header with the specified name and value exists in the response headers. 

### **HasHeader**
: Checks if a header with the specified name exists in the response headers. 

### **GetRange**
: Parses the `'Content-Range'` header's value and returns a [HTTPRange](HTTPRange.md) object representing the byte range of the response content. 
	!!! note ""
		If the server ignores a byte-range-spec because it is syntactically invalid, the server SHOULD treat the request as if the invalid Range header field did not exist. (Normally, this means return a 200 response containing the full entity). In this case because there are no `'Content-Range'` header values, this function will return `null`. 


### **Dispose**
: IDisposable implementation. 