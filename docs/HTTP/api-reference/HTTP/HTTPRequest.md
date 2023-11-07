---
comments: true
---
# HTTPRequest

Represents an HTTP request that allows you to send HTTP requests to remote servers and receive responses asynchronously. 

**Remarks:**

- **Asynchronous HTTP requests**: Utilize a Task-based API for performing HTTP requests asynchronously.
- **Unity coroutine support**: Seamlessly integrate with Unity's coroutine system for coroutine-based request handling.
- **HTTP method support**: Support for various HTTP methods including GET, POST, PUT, DELETE, and more.
- **Compression and decompression**: Automatic request and response compression and decompression for efficient data transfer.
- **Timing information**: Collect detailed timing information about the request for performance analysis.
- **Upload and download support**: Support for uploading and downloading files with progress tracking.
- **Customizable**: Extensive options for customizing request headers, handling cookies, and more.
- **Redirection handling**: Automatic handling of request redirections for a seamless experience.
- **Proxy server support**: Ability to route requests through proxy servers for enhanced privacy and security.
- **Authentication**: Automatic authentication handling using authenticators for secure communication.
- **Cancellation support**: Ability to cancel requests to prevent further processing and release resources.



## **Fields**:
### **[String[]](https://learn.microsoft.com/en-us/dotnet/api/System.String[]) `#!cs HTTPRequest.MethodNames`**
: Cached uppercase values to save some cpu cycles and GC alloc per request. 
### **[HTTPMethods](HTTPMethods.md) MethodType**
: The method that how we want to process our request the server. 
### **[Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) Uri**
: The original request's Uri. 
### **[Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) CurrentUri**
: If redirected it contains the RedirectUri. 
### **[HostKey](../HostSetting/HostKey.md) CurrentHostKey**
: A host-key that can be used to find the right host-variant for the request. 
### **[HTTPResponse](HTTPResponse.md) Response**
: The response received from the server. 
	!!! note ""
		If an exception occurred during reading of the response stream or can't connect to the server, this will be null!

### **[DownloadSettings](../Settings/DownloadSettings.md) DownloadSettings**
: Download related options and settings. 
### **[UploadSettings](../Settings/UploadSettings.md) UploadSettings**
: Upload related options and settings. 
### **[TimeoutSettings](../Settings/TimeoutSettings.md) TimeoutSettings**
: Timeout settings for the request. 
### **[RetrySettings](../Settings/RetrySettings.md) RetrySettings**
: Retry settings for the request. 
### **[ProxySettings](../Settings/ProxySettings.md) ProxySettings**
: Proxy settings for the request. 
### **[RedirectSettings](../Settings/RedirectSettings.md) RedirectSettings**
: Redirect settings for the request. 
### **[OnRequestFinishedDelegate](OnRequestFinishedDelegate.md) Callback**
: The callback function that will be called after the request is fully processed. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) IsCancellationRequested**
: Indicates if [Abort](#void-abort) is called on this request. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-1)&lt;[HTTPRequest]()&gt; OnCancellationRequested**
: Action called when [Abort](#void-abort) function is invoked. 
### **[Exception](https://learn.microsoft.com/en-us/dotnet/api/System.Exception) Exception**
: Stores any exception that occurs during processing of the request or response. 
	!!! note ""
		This property if for debugging purposes as [seen here](https://github.com/Benedicht/BestHTTP-Issues/issues/174)!

### **[Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object) Tag**
: Any user-object that can be passed with the request. 
### **[HTTPRequestStates](HTTPRequestStates.md) State**
: Current state of this request. 
### **[TimingCollector](../Timings/TimingCollector.md) Timing**
: Timing information about the request. 
### **[IAuthenticator](../Authenticators/IAuthenticator.md) Authenticator**
: An IAuthenticator implementation that can be used to authenticate the request. 
	!!! note ""
		Out-of-the-box included authenticators are [CredentialAuthenticator](../Authenticators/CredentialAuthenticator.md) and [BearerTokenAuthenticator](../Authenticators/BearerTokenAuthenticator.md).

### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) WithCredentials**
: Its value will be set to the XmlHTTPRequest's withCredentials field. Its default value is HTTPManager.IsCookiesEnabled's value. 
	!!! note ""
		More details can be found here: 

		- [Mozilla Developer Networks - XMLHttpRequest.withCredentials](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/withCredentials)



### **[LoggingContext](../Logger/LoggingContext.md) Context**
: Logging context of the request. 
### **[Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object) Current**
: [IEnumerator](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.IEnumerator)	 implementation, required for [Coroutine](https://docs.unity3d.com/ScriptReference/Coroutine.html) support. 
## **Methods**:

### [HTTPRequest]() HTTPRequest.CreateGet([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Creates an [HTTP GET](HTTPMethods.md#httpmethodsget) request with the specified URL. 

### [HTTPRequest]() HTTPRequest.CreateGet([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri))
: Creates an [HTTP GET](HTTPMethods.md#httpmethodsget) request with the specified URI. 

### [HTTPRequest]() HTTPRequest.CreateGet([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [OnRequestFinishedDelegate](OnRequestFinishedDelegate.md))
: Creates an [HTTP GET](HTTPMethods.md#httpmethodsget) request with the specified URL and registers a callback function to be called when the request is fully processed. 

### [HTTPRequest]() HTTPRequest.CreateGet([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri), [OnRequestFinishedDelegate](OnRequestFinishedDelegate.md))
: Creates an [HTTP GET](HTTPMethods.md#httpmethodsget) request with the specified URI and registers a callback function to be called when the request is fully processed. 

### [HTTPRequest]() HTTPRequest.CreatePost([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Creates an [HTTP POST](HTTPMethods.md#httpmethodspost) request with the specified URL. 

### [HTTPRequest]() HTTPRequest.CreatePost([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri))
: Creates an [HTTP POST](HTTPMethods.md#httpmethodspost) request with the specified URI. 

### [HTTPRequest]() HTTPRequest.CreatePost([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [OnRequestFinishedDelegate](OnRequestFinishedDelegate.md))
: Creates an [HTTP POST](HTTPMethods.md#httpmethodspost) request with the specified URL and registers a callback function to be called when the request is fully processed. 

### [HTTPRequest]() HTTPRequest.CreatePost([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri), [OnRequestFinishedDelegate](OnRequestFinishedDelegate.md))
: Creates an [HTTP POST](HTTPMethods.md#httpmethodspost) request with the specified URI and registers a callback function to be called when the request is fully processed. 

### [HTTPRequest]() HTTPRequest.CreatePut([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Creates an [HTTP PUT](HTTPMethods.md#httpmethodsput) request with the specified URL. 

### [HTTPRequest]() HTTPRequest.CreatePut([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri))
: Creates an [HTTP PUT](HTTPMethods.md#httpmethodsput) request with the specified URI. 

### [HTTPRequest]() HTTPRequest.CreatePut([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [OnRequestFinishedDelegate](OnRequestFinishedDelegate.md))
: Creates an [HTTP PUT](HTTPMethods.md#httpmethodsput) request with the specified URL and registers a callback function to be called when the request is fully processed. 

### [HTTPRequest]() HTTPRequest.CreatePut([Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri), [OnRequestFinishedDelegate](OnRequestFinishedDelegate.md))
: Creates an [HTTP PUT](HTTPMethods.md#httpmethodsput) request with the specified URI and registers a callback function to be called when the request is fully processed. 

### Void AddHeader([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Adds a header-value pair to the Headers. Use it to add custom headers to the request. 

### Void SetHeader([String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: For the given header name, removes any previously added values and sets the given one. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) RemoveHeader([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Removes the specified header and all of its associated values. Returns `true`, if the header found and succesfully removed. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) HasHeader([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Returns `true` if the given head name is already in the `HTTPRequest.Headers`. 

### [String](https://learn.microsoft.com/en-us/dotnet/api/System.String) GetFirstHeaderValue([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Returns the first header or `null` for the given header name. 

### [List](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List-1)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; GetHeaderValues([String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Returns all header values for the given header or `null`. 

### Void RemoveHeaders()
: Removes all headers. 

### Void SetRangeHeader([Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64))
: Sets the Range header to download the content from the given byte position. See http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35 

### Void SetRangeHeader([Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64), [Int64](https://learn.microsoft.com/en-us/dotnet/api/System.Int64))
: Sets the Range header to download the content from the given byte position to the given last position. See http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35 

### [HTTPRequest]() Send()
: Starts processing the request. 

### Void Abort()
: Cancels any further processing of the HTTP request. 

### Void Clear()
: Resets the request for a state where switching MethodType is possible. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) MoveNext()
: [IEnumerator](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.IEnumerator)	 implementation, required for [Coroutine](https://docs.unity3d.com/ScriptReference/Coroutine.html) support. 

### Void Reset()
: [IEnumerator](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.IEnumerator)	 implementation throwing [NotImplementedException](https://learn.microsoft.com/en-us/dotnet/api/System.NotImplementedException), required for [Coroutine](https://docs.unity3d.com/ScriptReference/Coroutine.html) support. 

### Void Dispose()
: Disposes of resources used by the HTTPRequest instance. 