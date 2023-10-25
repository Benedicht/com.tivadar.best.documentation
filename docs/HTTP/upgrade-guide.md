---
comments: true
---

This guide is designed to help users seamlessly transition from **Best HTTP/2** to the new major release (v3.x).
If you're updating your package, please read through the relevant sections to ensure a smooth upgrade.

## Pre-upgrade Checklist
- [x] **Backup Your Project:** Always create a backup of your entire project before starting the upgrade process. This allows you to revert changes if something goes awry.
- [x] **Review Deprecated Features:** Check if you're using any features or methods that were marked as deprecated in the last release. Transition away from these first.

## Post-upgrade Steps
- [x] **Update API Calls:** If the new version introduced new methods or altered existing ones, update your calls accordingly.
- [x] **Test Extensively:** After upgrading, test all functionalities in your project that utilize the Best HTTP package to ensure they work as expected.

## ^^List of Breaking Changes^^

I have worked hard to enhance features, fix issues, and introduce new capabilities - here's what you need to know:

### 1. Namespace changes

Instead of one big package the new version is split into multiple packages. This packaging change is reflected in how the plugins' namespaces are named. 
For the Best HTTP package this means that its root namespace is `Best.HTTP` instead of `BestHTTP`.
Upgrading old code might need only an additional dot ('.') in the middle. 
For a better upgrade experience I kept the most used [HTTPRequest](api-reference/HTTP/HTTPRequest.md) and `HTTPResponse` classes in the root namespace.

However, other classes are now under different namespaces. Here I'll list a few common classes, their old and new namespaces:

| Class | Old Namespace { title="Namespace of the class in Best HTTP/2" } | New Namespace { title="Namespace of the class in Best HTTP v3" } |
|------------|---------------|---------------|
| `HTTPRequest` | `BestHTTP` | `Best.HTTP` |
| `HTTPResponse` | `BestHTTP` | `Best.HTTP` |
| `HTTPManager` | `BestHTTP` | `Best.HTTP.Shared` |
| `HTTPProxy` | `BestHTTP` | `Best.HTTP.Proxies` |
| `LogLevels` | `BestHTTP.Logger` | `Best.HTTP.Shared.Logger` |

??? Example
    === "Old"
        ```cs
        using BestHTTP;
        using BestHTTP.Logger;
        ```

    === "New"
        ```cs
        using Best.HTTP;
        using Best.HTTP.Shared;
        using Best.HTTP.Shared.Logger;
        using Best.HTTP.Proxies;
        ```

Depending on what IDE you use, deleting old usings first your IDE might help finding the new ones.

### 2. [HTTPRequest](api-reference/HTTP/HTTPRequest.md) changes

#### ^^Removed^^

- **Constructors**: Removed constructors with `isKeepAlive` and/or `disableCache` parameters and kept those that set only either of uri/method/callback or all of them.
The prefered way to set these properties are through their respective properties!

- **Various ways to upload content**: `RawData`, forms (exposed through `AddField`/`AddBinaryData` and `FormUsage`) are **removed** and merged into one `UploadStream`. 
Forms now can be uploaded through concrete, ready to use implementations: `UrlEncodedStream` and `MultipartFormDataStream`. 
To access more advanced scenarios an abstract class, `UploadStreamBase` is also available for custom implementations, 
like the plugin's own `JSonDataStream` or `DynamicUploadStream`. For examples about how to use them, please refer the plugin's samples.

??? Example "Send a form `multipart/form-data` encoded"
    === "Old"
        ```cs
        using BestHTTP;

        var request = new HTTPRequest(new Uri("..."));

        request.AddField("Key", "Value");

        request.Send();
        ```
    === "New"
        ```cs
        using Best.HTTP;
        using Best.HTTP.Request.Upload.Forms;

        var request = new HTTPRequest(new Uri("..."));

        request.UploadSettings.UploadStream = new MultipartFormDataStream()
                .AddField("Key", "Value");

        request.Send();
        ```
- **UseUploadStreamLength**: `UploadStreamBase` and its implementors must handle length calculations and what to return for unknown lengths.

- **OnStreamingData, StreamFragmentSize, StreamChunksImmediately, ReadBufferSizeOverride, MaxFragmentQueueLength**: These were hard to use properly, and now there's a new `DownloadContentStream` implementation to make download streaming easier.
??? Example "Using DownloadContentStream"
    Relevant parts from the example that comes with the package:
    ```cs hl_lines="11 27 34 37 59"
    protected override void Start()
    {
        base.Start();

        // Create a regular get request with a regular callback too. We still need a callback,
        //  because it might encounter an error before able to start a download. 
        _request = HTTPRequest.CreateGet(this._baseAddress, OnRequestFinishedCallack);

        // Request a notification when download starts. This callback will be fired when
        //  the status code suggests that we can expect actual content (2xx status codes).
        _request.DownloadSettings.OnDownloadStarted += OnDownloadStarted;

        // Don't want to retry when there's a failure
        _request.RetrySettings.MaxRetries = 0;

        // Start processing the request
        _request.Send();

        AddUIText("Connecting...");
    }

    private void OnDownloadStarted(HTTPRequest req, HTTPResponse resp, DownloadContentStream stream)
    {
        AddUIText("Download started!");

        // We can expect content from the server, start our logic.
        StartCoroutine(ParseContent(stream));
    }

    IEnumerator ParseContent(DownloadContentStream stream)
    {
        try
        {
            while (!stream.IsCompleted)
            {
                // Try to take out a download segment from the Download Stream.
                if (stream.TryTake(out var buffer))
                {
                    // Make sure that the buffer is released back to the BufferPool.
                    using var _ = buffer.AsAutoRelease();

                    try
                    {
                        // Try to create a string from the downloaded content
                        var str = Encoding.UTF8.GetString(buffer.Data, buffer.Offset, buffer.Count).TrimEnd();

                        // And display it in the UI
                        AddUIText(str);
                    }
                    catch { }
                }

                yield return null;
            }
        }
        finally
        {
            // Don't forget to Dispose the stream!
            stream.Dispose();
        }
    }
    ```

#### ^^Changed/Moved^^

- **Moved properties under settings classes**: Over the years as the [HTTPRequest](api-reference/HTTP/HTTPRequest.md) got more and more features, new properties and callbacks popped up one by one making it 
cluttered, unorganized. In this version, most of the properties and callbacks are still there with the same behavior, but located under setting classes.

??? Example "Example with UploadStream"
    So, for example the above mentioned [UploadStream](api-reference/Settings/UploadSettings.md#UploadStream) moved into the [UploadSettings](api-reference/Settings/UploadSettings.md) class and can be accessed through a field with the same name in [HTTPRequest](api-reference/HTTP/HTTPRequest.md):

    === "Old"
        ```cs
        var request = new HTTPRequest(new Uri("..."));
        request.UploadStream = new MemoryStream();
        request.Send();
        ```
    === "New"
        ```cs
        var request = new HTTPRequest(new Uri("..."));
        request.UploadSettings.UploadStream = new MemoryStream();
        request.Send();
        ```
    Other upload related fields are relocated too, like `OnUploadProgress`.

Here you can find a non-exhaustive list of these changes:

| Member | Moved under | Accessible as |
|--------|-------------|---------------|
| UploadStream | [UploadSettings](api-reference/Settings/UploadSettings.md) | request.UploadStettings.UploadStream = ...; |
| OnUploadProgress | [UploadSettings](api-reference/Settings/UploadSettings.md) | request.UploadSettings.OnUploadProgress += ...; |
| OnHeadersReceived | [DownloadSettings](api-reference/Settings/DownloadSettings.md) | request.DownloadSettings.OnHeadersReceived += ...; |
| OnDownloadStarted | [DownloadSettings](api-reference/Settings/DownloadSettings.md) | request.DownloadSettings.OnDownloadStarted += ...; |
| Timeout | [TimeoutSettings](api-reference/Settings/TimeoutSettings.md) | request.TimeoutSettings.Timeout = TimeSpan.FromSeconds(xy); |
| ConnectTimeout | [TimeoutSettings](api-reference/Settings/TimeoutSettings.md) | request.TimeoutSettings.ConnectTimeout = TimeSpan.FromSeconds(xy); |
| Retries | [RetrySettings](api-reference/Settings/RetrySettings.md) | request.RetrySettings.Retries = xy; |
| MaxRetries | [RetrySettings](api-reference/Settings/RetrySettings.md) | request.RetrySettings.MaxRetries = xy; |
| MaxRedirects | [RedirectSettings](api-reference/Settings/RedirectSettings.md) | request.RedirectSettings.MaxRedirects = xy; |
| Proxy | [ProxySettings](api-reference/Settings/ProxySettings.md) | request.ProxySettings.Proxy = new HTTPProxy(...); |

- **Authententication**: Instead of a single [Credentials](api-reference/Authentication/Credentials.md) property, starting with this version authentication is implemented with the help of the [IAuthenticator](api-reference/Authenticators/IAuthenticator.md) interface.
The plugin ships with the [CredentialAuthenticator](api-reference/Authenticators/CredentialAuthenticator.md) and [BearerTokenAuthenticator](api-reference/Authenticators/BearerTokenAuthenticator.md) implementations.
More details can be found in the [Getting started/Authentication](getting-started/authentication.md) topic!

#### ^^New^^

- **Static functions for HTTPRequest creation **: With the new static functions you can express more explicitly what type of request is created with less typeing.
    - Instead of `#! new HTTPRequest("https://", HTTPMethods.Post, callback);` now it can be just `#!cs HTTPRequest.CreatePOST("https://...", callback);`.
- **New constructors**: While I removed a few, I also added a few to support passing URLs as strings, `HTTPRequest` will convert them to `System.Uri` instances.
- **Authenticator**

### 3. [HTTPResponse](api-reference/HTTP/HTTPResponse.md) changes

#### ^^Removed^^

- **Cookies**: Cookies aren't stored for each response, instead `#!cs CookieJar.Get(Uri uri)` can be used to get them on demain.
- **VersionMajor/VersionMinor**: Merged them into one `#!cs public Version HTTPVersion { get; protected set; }` property.
- **IsStreamed**: Removed, every response is streamed into the `HTTPResponse`'s `DownStream`!
- **IsCacheOnly**: The same information can acquired through the parent `HTTPRequest`.
- **CacheFileInfo**: The same functionality should be possible with the new `HTTPCache` class, available as `HTTPManager.LocalCache`. [Let me know](../Shared/support.md) if you relied on it but can't find matching functionality.
- **IsProxyResponse**: Removed without further explanation. [Let me know](../Shared/support.md) if you relied on it but can't find matching functionality.
- **IsClosedManually**: Used by other protocols (Websocket, EventSource), now they are dealing with the connection differently.

#### ^^Changed/Moved^^

- **Downloaded data handling ([DownloadContentStream](api-reference/Response/DownloadContentStream.md) [DownStream](api-reference/HTTP/HTTPResponse.md#downstream))**: As already [mentioned](#removed), all downloads are streamed downloads downloading into a `DownloadContentStream` instance and its reference is stored int `HTTPResponse`'s `DownStream`.
Buffering, thread synchronization and memory management is all done by the `DownloadContentStream`. For smaller downloads, the `HTTPResponse` still maintains its shortcuts: `DataAsText`, `DataAsTexture2D` and the `Data` property became a shortcut too:
    
    ??? Example
        ```cs hl_lines="13 16 26 29"
        public byte[] Data
        {
            get
            {
                if (this._data != null)
                    return this._data;

                if (this.DownStream == null)
                    return null;

                CheckDisposed();

                this._data = new byte[this.DownStream.Length]; // (1)
                try
                {
                    this.DownStream.Read(this._data, 0, this._data.Length); // (2)
                }
                catch (Exception ex)
                {
                    this._data = null;

                    HTTPManager.Logger.Exception(nameof(HTTPResponse), "get_Data", ex, this.Context);
                }
                finally
                {
                    this.DownStream.Dispose(); // (3)
                }

                return this._data; // (4)
            }
        }
        private byte[] _data;
        ```

        1. Allocate a large enough buffer
        2. Read all data to the buffer from the content stream
        3. Dispose the content stream
        4. Return with the buffer

#### ^^New^^

- **DownStream**: Discussed [above](#changedmoved_1).

### 4. [HTTPManager](api-reference/Shared/HTTPManager.md) changes

#### ^^Removed^^

- **MaxPathLength**: Removed without further explanation.
- **IsCookiesEnabled**: Removed without further explanation. If there will be any need to come back, it might be a new per-host setting somewhere.
- **SendRequest(...)**: Removed without further explanation.
- **SendBufferSize**: Not a direct replacement, but plugin buffer sizes can be controlled through `#!cs Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*").LowLevelConnectionSettings.TCPWriteBufferSize`
- **ReceiveBufferSize**: Not a direct replacement, but plugin buffer sizes can be controlled through `#!cs Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*").LowLevelConnectionSettings.ReadBufferSize`

#### ^^Changed/Moved^^

- **MaxConnectionPerServer**: Became a per-host setting, it can be changed for an arbitrary host or globally.
??? Example
    
    === "Old"
        ```cs
        BestHTTP.HTTPManager.MaxConnectionPerServer = 10;
        ```
    === "New Global"
        ```cs
        Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*").HostVariantSettings.MaxConnectionPerVariant = 10;
        ```
    === "New for a host"
        ```cs
        Best.HTTP.Shared.HTTPManager.PerHostSettings.AddDefault("example.com").HostVariantSettings.MaxConnectionPerVariant = 10;
        ```
    
- **KeepAliveDefaultValue**: Became a per-host setting, it can be changed for an arbitrary host or globally: 
??? Example
    ```cs
    Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*")
        .HTTP1ConnectionSettings.TryToReuseConnections = false;
    ```
- **MaxConnectionIdleTime**: Became a per-host setting, it can be changed for an arbitrary host or globally: 
??? Example
    ```cs 
    Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*")
        .HTTP1ConnectionSettings.MaxConnectionIdleTime = TimeSpan.FromSeconds(10);
    ```
- **HTTP2Settings**: Became a per-host setting, it can be changed for an arbitrary host or globally: 
??? Example
    ```cs 
    Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*")
        .HTTP2ConnectionSettings.EnableHTTP2Connections = true;
    ```
- **ConnectTimeout**: Became a per-host setting, it can be changed for an arbitrary host or globally:
??? Example
    ```cs 
    Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*")
        .RequestSettings.ConnectTimeout = TimeSpan.FromSeconds(10);
    ```
- **RequestTimeout**: Became a per-host setting, it can be changed for an arbitrary host or globally: 
??? Example
    ```cs 
    Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*")
        .RequestSettings.RequestTimeout = TimeSpan.FromSeconds(10);
    ```
!!! Warning
    Its default value changed to never time out.
- **IsCachingDisabled**: Removed without further explanation, caching can be disabled per-request by setting the request's `DownloadSettings.DisableCache` to true.
- **CookieJarSize**: => `CookieJar.MaximumSize`
- **EnablePrivateBrowsing**: => `CookieJar.IsSessionOverride`
- **RootCacheFolderProvider**: => `RootSaveFolderProvider`
- **UserAgent**: Changed its default value to include the package version set through AssemblyVersion.cs and the Unity runtime version: 
??? Example
    ```cs hl_lines="6"
    Assembly thisAssem = typeof(HTTPManager).Assembly;
    AssemblyName thisAssemName = thisAssem?.GetName();

    Version ver = thisAssemName?.Version;

    UserAgent = $"com.Tivadar.Best.HTTP v{ver}/Unity {UnityEngine.Application.unityVersion}";
    ```

- **TlsClientFactory**: Became a per-host setting, it can be changed for an arbitrary host or globally:
??? Example
    ```cs 
    Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*")
        .TLSSettings.BouncyCastleSettings.TlsClientFactory = (uri, protocols, context) => {
            return new CustomTlsclient(...);
        };
    ```
- **DefaultTlsClientFactory**: Moved under `#!cs Best.HTTP.Hosts.Settings.BouncyCastleSettings`
- **UseAlternateSSLDefaultValue**: Became a per-host setting, it can be changed for an arbitrary host or globally:
??? Example

    === "Old"
    ```cs
    // Use SslStream for TLS negotiation for all connections
    BestHTTP.HTTPManager.UseAlternateSSLDefaultValue = false;
    ```
    === "New Global"
    ```cs
    Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*")
        .TLSSettings.TLSHandler = TLSHandlers.Framework;
    ```
    === "New for one host"
    ```cs
    Best.HTTP.Shared.HTTPManager.PerHostSettings.AddDefault("example.com")
        .TLSSettings.TLSHandler = TLSHandlers.Framework;
    ```

- **DefaultCertificationValidator**: Became a per-host setting, it can be changed for an arbitrary host or globally:
??? Example
    ```cs hl_lines="2"
    Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*")
        .TLSSettings.FrameworkTLSSettings.CertificationValidator 
            = (host, certificate, chain, sslPolicyErrors) 
                => true;
    ```
- **ClientCertificationProvider**: Became a per-host setting, it can be changed for an arbitrary host or globally:
??? Example
    ```cs hl_lines="2"
    Best.HTTP.Shared.HTTPManager.PerHostSettings.Get("*")
        .TLSSettings.FrameworkTLSSettings.ClientCertificationProvider
            = (targetHost, localCertificates, remoteCertificate, acceptableIssuers)
                => null;
    ```

#### ^^New^^

- **LocalCache**: Instead of a static class, caching now can be accessed through `#!cs Best.HTTP.HTTPManager.LocalCache`, a `HTTPCache` instance.
- **PerHostSettings**: Most of the entries in the [Changed/Moved](#changedmoved_2) section can be changed on a per-host basis through this field.

### 5. Caching changes

HTTP content caching is got completely reimplemented in the [HTTPCache](api-reference/Caching/HTTPCache.md) class. Demoted from a static class, its properties and functions can be accessed through `Best.HTTP.HTTPManager.LocalCache`.

Most notable changes/features are:

1. Maintenance is executed on every startup or when a new entry would increase the overall size over the limit.
2. The maximum size of the cache is enforced during caching. In previous versions entries only evicted during maintanance.
3. Headers and content now stored separately in different files. A file stream can be easily acquired by calling two functions.

### 6. [Cookie](api-reference/Cookies/CookieJar.md) changes

1. Cookies can't be set directly for a `HTTPRequest`, but using `#!cs CookieJar.Set(Uri uri, Cookie cookie)` or `#!cs CookieJar.Set(Cookie cookie)`.
2. Received cookies aren't stored for each `HTTPResponse` but they can be acquired with the `#!cs CookieJar.Get(Uri uri)` function.

### 7. [Authentication](getting-started/authentication.md) changes

Previous versions supported only HTTP authentication (Basic and Digest) through the Credentials property that allowed only to set a username-password pair.
Starting with this version, authentication can be done by using an authenticator implementing the `IAuthenticator` interface opening a wide range of possibilities.

The plugin ships with two IAuthenticator implementations, located in the `Best.HTTP.Request.Authenticators` namespace:

1. `CrendetialAuthenticator` to support the old behavior for Basic and Digest HTTP authentications.
2. `BearerTokenAuthenticator` to send `Authorization` headers with a Bearer token.

## General Tips

1. **Stay Updated on Documentation:** Keep an eye on the official documentation for the Best HTTP package. It's regularly updated with new information, tutorials, and solutions to common problems.
2. **Engage with the Community:** Join discussions on our [Community and Support page](../Shared/support.md) to share your experiences, ask questions, and get advice on the upgrade process.
3. **Check for Updates Regularly:** Ensure you always have the latest features, improvements, and bug fixes by regularly checking for updates.


*[IDE]: Integrated Development Environment
*[URL]: Uniform Resource Locator