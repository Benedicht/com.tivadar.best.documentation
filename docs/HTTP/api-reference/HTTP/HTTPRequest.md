# HTTPRequest

Represents an HTTP request that allows you to send HTTP requests to remote servers and receive responses asynchronously. 

**Remarks**:

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
### **MethodNames**
: Cached uppercase values to save some cpu cycles and GC alloc per request. 
### **MethodType**
: The method that how we want to process our request the server. 
### **Uri**
: The original request's Uri. 
### **CurrentUri**
: If redirected it contains the RedirectUri. 
### **CurrentHostKey**
: A host-key that can be used to find the right host-variant for the request. 
### **Response**
: The response received from the server. 
	!!! note ""
		If an exception occurred during reading of the response stream or can't connect to the server, this will be null!

### **DownloadSettings**
: Download related options and settings. 
### **UploadSettings**
: Upload related options and settings. 
### **TimeoutSettings**
: Timeout settings for the request. 
### **RetrySettings**
: Retry settings for the request. 
### **ProxySettings**
: Proxy settings for the request. 
### **RedirectSettings**
: Redirect settings for the request. 
### **Callback**
: The callback function that will be called after the request is fully processed. 
### **IsCancellationRequested**
: Indicates if [Abort](../HTTP/HTTPRequest.md#abort) is called on this request. 
### **CancellationTokenSource**
: Gets the cancellation token source for this request. 
### **OnCancellationRequested**
: Action called when [Abort](../HTTP/HTTPRequest.md#abort) function is invoked. 
### **Exception**
: Stores any exception that occurs during processing of the request or response. 
### **Tag**
: Any user-object that can be passed with the request. 
### **State**
: Current state of this request. 
### **Timing**
: Timing information about the request. 
### **Authenticator**
: An IAuthenticator implementation that can be used to authenticate the request. 
	!!! note ""
		Out-of-the-box included authenticators are [CredentialAuthenticator](../Authenticators/CredentialAuthenticator.md) and [BearerTokenAuthenticator](../Authenticators/BearerTokenAuthenticator.md).

### **WithCredentials**
: Its value will be set to the XmlHTTPRequest's withCredentials field. Its default value is HTTPManager.IsCookiesEnabled's value. 
	!!! note ""
		More details can be found here: 

		- [Mozilla Developer Networks - XMLHttpRequest.withCredentials](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/withCredentials)



### **Context**
: Logging context of the request. 
### **Current**
: **IEnumerator.Current**	 implementation, required for **Coroutine** support. 
## **Methods**:

### **CreateGet**
: Creates an HTTP GET request with the specified URL. 

### **CreateGet**
: Creates an HTTP GET request with the specified URI. 

### **CreateGet**
: Creates an HTTP GET request with the specified URL and registers a callback function to be called when the request is fully processed. 

### **CreateGet**
: Creates an HTTP GET request with the specified URI and registers a callback function to be called when the request is fully processed. 

### **CreatePost**
: Creates an HTTP POST request with the specified URL. 

### **CreatePost**
: Creates an HTTP POST request with the specified URI. 

### **CreatePost**
: Creates an HTTP POST request with the specified URL and registers a callback function to be called when the request is fully processed. 

### **CreatePost**
: Creates an HTTP POST request with the specified URI and registers a callback function to be called when the request is fully processed. 

### **CreatePut**
: Creates an HTTP PUT request with the specified URL. 

### **CreatePut**
: Creates an HTTP PUT request with the specified URI. 

### **CreatePut**
: Creates an HTTP PUT request with the specified URL and registers a callback function to be called when the request is fully processed. 

### **CreatePut**
: Creates an HTTP PUT request with the specified URI and registers a callback function to be called when the request is fully processed. 

### **#ctor**
: Creates an HTTP GET request with the specified URL. 

### **#ctor**
: Creates an HTTP GET request with the specified URL and registers a callback function to be called when the request is fully processed. 

### **#ctor**
: Creates an HTTP GET request with the specified URL and HTTP method type. 

### **#ctor**
: Creates an HTTP request with the specified URL, HTTP method type, and registers a callback function to be called when the request is fully processed. 

### **#ctor**
: Creates an HTTP GET request with the specified URI. 

### **#ctor**
: Creates an HTTP GET request with the specified URI and registers a callback function to be called when the request is fully processed. 

### **#ctor**
: Creates an HTTP request with the specified URI and HTTP method type. 

### **#ctor**
: Creates an HTTP request with the specified URI, HTTP method type, and registers a callback function to be called when the request is fully processed. 

### **AddHeader**
: Adds a header-value pair to the Headers. Use it to add custom headers to the request. 

### **SetHeader**
: For the given header name, removes any previously added values and sets the given one. 

### **RemoveHeader**
: Removes the specified header and all of its associated values. Returns `true`, if the header found and succesfully removed. 

### **HasHeader**
: Returns `true` if the given head name is already in the [Headers](../HTTP/HTTPRequest.md#headers). 

### **GetFirstHeaderValue**
: Returns the first header or `null` for the given header name. 

### **GetHeaderValues**
: Returns all header values for the given header or `null`. 

### **RemoveHeaders**
: Removes all headers. 

### **SetRangeHeader**
: Sets the Range header to download the content from the given byte position. See http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35 

### **SetRangeHeader**
: Sets the Range header to download the content from the given byte position to the given last position. See http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35 

### **Send**
: Starts processing the request. 

### **Abort**
: Cancels any further processing of the HTTP request. 

### **Clear**
: Resets the request for a state where switching MethodType is possible. 

### **MoveNext**
: **IEnumerator.MoveNext**	 implementation, required for **Coroutine** support. 

### **Reset**
: **IEnumerator.MoveNext**	 implementation throwing **NotImplementedException**, required for **Coroutine** support. 

### **Dispose**
: Disposes of resources used by the HTTPRequest instance. 