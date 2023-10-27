---
comments: true
---
# HTTPRequestAsyncExtensions

A collection of extension methods for working with HTTP requests asynchronously using [Task`1](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task`1). 


## **Methods**:

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[AssetBundle](https://docs.unity3d.com/ScriptReference/AssetBundle.html)&gt; HTTPRequestAsyncExtensions.GetAssetBundleAsync([HTTPRequest](HTTPRequest.md), [CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken))
: Asynchronously sends an HTTP request and retrieves the response as an [AssetBundle](https://docs.unity3d.com/ScriptReference/AssetBundle.html). 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[HTTPResponse](HTTPResponse.md)&gt; HTTPRequestAsyncExtensions.GetHTTPResponseAsync([HTTPRequest](HTTPRequest.md), [CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken))
: Asynchronously sends an HTTP request and retrieves the raw [HTTPResponse](HTTPResponse.md). 
	!!! note ""
		This method is particularly useful when you want to access the raw response without any specific processing  like converting the data into a string, texture, or other formats. It provides flexibility in handling  the response for custom or advanced use cases. 


### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; HTTPRequestAsyncExtensions.GetAsStringAsync([HTTPRequest](HTTPRequest.md), [CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken))
: Asynchronously sends an [HTTPRequest](HTTPRequest.md) and retrieves the response content as a `string`. 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[Texture2D](https://docs.unity3d.com/ScriptReference/Texture2D.html)&gt; HTTPRequestAsyncExtensions.GetAsTexture2DAsync([HTTPRequest](HTTPRequest.md), [CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken))
: Asynchronously sends an [HTTPRequest](HTTPRequest.md) and retrieves the response content as a [Texture2D](https://docs.unity3d.com/ScriptReference/Texture2D.html). 

### [Task](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.Tasks.Task-1)&lt;[Byte[]](https://learn.microsoft.com/en-us/dotnet/api/System.Byte[])&gt; HTTPRequestAsyncExtensions.GetRawDataAsync([HTTPRequest](HTTPRequest.md), [CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken))
: Asynchronously sends an [HTTPRequest](HTTPRequest.md) and retrieves the response content as a `byte[]`. 