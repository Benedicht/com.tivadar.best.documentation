---
comments: true
---

# The IAuthenticationProvider interface

To authenticate a SignalR Core session an `IAuthenticationProvider` implementation can be set to the hub connection's `AuthenticationProvider` property. 
The plugin implements a `DefaultAccessTokenAuthenticator` (in the `Best.SignalR.Authentication` namespace) and uses it as the default authenticator.

!!! Note "With the help of `DefaultAccessTokenAuthenticator`, the plugin can connect to Azure SignalR Service out-of-the-box."

The `IAuthenticationProvider` has the following properties and events:

- **IsPreAuthRequired**: If returns `true`, the implementation **MUST** implement the `StartAuthentication` and `Cancel` methods and use the `OnAuthenticationSucceded` and `OnAuthenticationFailed` events!
- **OnAuthenticationSucceded**: This event must be called when the pre-authentication succeded. When IsPreAuthRequired is false, no-one will subscribe to this event.
- **OnAuthenticationFailed**: This event must be called when the pre-authentication failed. When IsPreAuthRequired is false, no-one will subscribe to this event.
- **StartAuthentication**: This function called once, when the before the SignalR negotiation begins. If IsPreAuthRequired is false, then this step will be skipped.
- **PrepareRequest**: This function will be called for every request before sending it.
- **PrepareUri**: This function can customize the given uri. If there's no intention to modify the uri, this function should return with the parameter.

## Default Implementation

Here's the implementation of the `DefaultAccessTokenAuthenticator`:

```cs
using System;

namespace Best.SignalR.Authentication
{
    /// <summary>
    /// Represents the default access token authenticator that uses the Bearer token scheme for HTTP and WebSockets.
    /// </summary>
    public sealed class DefaultAccessTokenAuthenticator : IAuthenticationProvider
    {
        /// <summary>
        /// Indicates that no pre-authentication step is required for this type of authentication.
        /// </summary>
        public bool IsPreAuthRequired { get { return false; } }

#pragma warning disable 0067
        /// <summary>
        /// This event is not used because <see cref="IsPreAuthRequired"/> is <c>false</c>.
        /// </summary>
        public event OnAuthenticationSuccededDelegate OnAuthenticationSucceded;

        /// <summary>
        /// This event is not used because <see cref="IsPreAuthRequired"/> is <c>false</c>.
        /// </summary>
        public event OnAuthenticationFailedDelegate OnAuthenticationFailed;

#pragma warning restore 0067

        private HubConnection _connection;

        /// <summary>
        /// Initializes a new instance of the DefaultAccessTokenAuthenticator class.
        /// </summary>
        /// <param name="connection">The <see cref="HubConnection"/> for this authenticator.</param>
        public DefaultAccessTokenAuthenticator(HubConnection connection) => this._connection = connection;

        /// <summary>
        /// Not used as IsPreAuthRequired is false
        /// </summary>
        public void StartAuthentication() { }

        /// <summary>
        /// Prepares the HTTP request by adding appropriate authentication headers or query parameters based on the request type.
        /// </summary>
        /// <param name="request">The HTTP request to prepare.</param>
        public void PrepareRequest(Best.HTTP.HTTPRequest request)
        {
            if (this._connection.NegotiationResult == null)
                return;

            // Add Authorization header to http requests, add access_token param to the uri otherwise
            if (Best.HTTP.Hosts.Connections.HTTPProtocolFactory.GetProtocolFromUri(request.CurrentUri) == Best.HTTP.Hosts.Connections.SupportedProtocols.HTTP)
                request.SetHeader("Authorization", "Bearer " + this._connection.NegotiationResult.AccessToken);
            else
                if (Best.HTTP.Hosts.Connections.HTTPProtocolFactory.GetProtocolFromUri(request.Uri) != Best.HTTP.Hosts.Connections.SupportedProtocols.WebSocket)
                    request.Uri = PrepareUriImpl(request.Uri);
        }

        /// <summary>
        /// Prepares the URI by appending the access token if necessary.
        /// </summary>
        /// <param name="uri">The original URI.</param>
        /// <returns>The prepared URI with the access token appended if necessary.</returns>
        public Uri PrepareUri(Uri uri)
        {
            if (this._connection.NegotiationResult == null)
                return uri;

            if (uri.Query.StartsWith("??"))
            {
                UriBuilder builder = new UriBuilder(uri);
                builder.Query = builder.Query.Substring(2);

                return builder.Uri;
            }

            if (Best.HTTP.Hosts.Connections.HTTPProtocolFactory.GetProtocolFromUri(uri) == Best.HTTP.Hosts.Connections.SupportedProtocols.WebSocket)
                uri = PrepareUriImpl(uri);

            return uri;

        }

        /// <summary>
        /// Internal method to prepare the URI by appending the access token.
        /// </summary>
        /// <param name="uri">The original URI.</param>
        /// <returns>The prepared URI with the access token appended.</returns>
        private Uri PrepareUriImpl(Uri uri)
        {
            if (this._connection.NegotiationResult != null && !string.IsNullOrEmpty(this._connection.NegotiationResult.AccessToken))
            {
                string query = string.IsNullOrEmpty(uri.Query) ? "" : uri.Query + "&";
                UriBuilder uriBuilder = new UriBuilder(uri.Scheme, uri.Host, uri.Port, uri.AbsolutePath, query + "access_token=" + this._connection.NegotiationResult.AccessToken);
                return uriBuilder.Uri;
            }

            return uri;
        }

        /// <summary>
        /// Cancels any ongoing authentication operations.
        /// </summary>
        public void Cancel() { }
    }
}
```

## Using an IAuthenticationProvider implementation

An `IAuthenticationProvider` implementation can be used through the `HubConnection`'s `AuthenticationProvider`:
```cs hl_lines="4"
using Best.SignalR.Authentication;

var hub = new HubConnection(new Uri("https://server/hub"), new JsonProtocol(new LitJsonEncoder()));
hub.AuthenticationProvider = new DefaultAccessTokenAuthenticator(hub);
```