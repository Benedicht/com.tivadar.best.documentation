---
comments: true
---

To send already obtained JWT tokens in the `Authorization` header (or as query parameter on WebGL for WebSockets) the `HeaderAuthenticator` can be used.

## Usage

`HubConnection` has an `AuthenticationProvider` property and will use that authenticator through its lifetime. It's very advised to set it only once when the `HubConnection` is created:

```cs
hub = new HubConnection(new Uri("https://myurl"), protocol);
hub.AuthenticationProvider = new HeaderAuthenticator("< token >");
```

## How/where to get it

The `HeaderAuthenticator` is located in the samples that comes with the package and can be installed to the project through, but as a reference or to add only the `HeaderAuthenticator` to the project here's its source too:

```cs
using System;

namespace Best.SignalR.Authentication
{
    public sealed class HeaderAuthenticator : IAuthenticationProvider
    {
        /// <summary>
        /// No pre-auth step required for this type of authentication
        /// </summary>
        public bool IsPreAuthRequired { get { return false; } }

#pragma warning disable 0067
        /// <summary>
        /// Not used event as IsPreAuthRequired is false
        /// </summary>
        public event OnAuthenticationSuccededDelegate OnAuthenticationSucceded;

        /// <summary>
        /// Not used event as IsPreAuthRequired is false
        /// </summary>
        public event OnAuthenticationFailedDelegate OnAuthenticationFailed;

#pragma warning restore 0067

        private string _credentials;

        public HeaderAuthenticator(string credentials)
        {
            this._credentials = credentials;
        }

        /// <summary>
        /// Not used as IsPreAuthRequired is false
        /// </summary>
        public void StartAuthentication()
        { }

        /// <summary>
        /// Prepares the request by adding two headers to it
        /// </summary>
        public void PrepareRequest(Best.HTTP.HTTPRequest request)
        {
#if !UNITY_WEBGL || UNITY_EDITOR
            request.SetHeader("Authorization", "Bearer " + this._credentials);
#endif
        }

        public Uri PrepareUri(Uri uri)
        {
#if UNITY_WEBGL && !UNITY_EDITOR
            string query = string.IsNullOrEmpty(uri.Query) ? "?" : uri.Query + "&";
            UriBuilder uriBuilder = new UriBuilder(uri.Scheme, uri.Host, uri.Port, uri.AbsolutePath, query + "access_token=" + this._credentials);
            return uriBuilder.Uri;
#else
            return uri;
#endif
        }

        public void Cancel()
        {

        }
    }
}
```