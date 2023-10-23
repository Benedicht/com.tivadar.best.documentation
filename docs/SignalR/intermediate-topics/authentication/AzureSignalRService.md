# Azure SignalR Service

The plugin can connect to the an Azure SignalR Service with its default authenticator.

!!! Warning "When used with Azure Functions Invoke and other client to server messaging can be done through Azure Functions (HTTP requests). See [https://docs.microsoft.com/en-us/azure/azure-signalr/signalr-concept-serverless-development-config#sending-messages-from-a-client-to-the-service](https://docs.microsoft.com/en-us/azure/azure-signalr/signalr-concept-serverless-development-config#sending-messages-from-a-client-to-the-service)"

## Azure SignalR Service with Azure Functions

When a `/negotiate` endpoint is defined in Azure Functions the SignalR client must connect to the Azure Functions service. 

```cs
var conn = new HubConnection(new Uri("http://localhost:7071/api/"), new JsonProtocol(new LitJsonEncoder()));
        
conn.On<string>("newMessage", msg =>
{
    Debug.Log(msg);
});
               
conn.StartConnect();
```

When Azure SignalR Service is used with Functions, negotiating the protocol starts by getting the first connection information from Functions that contains both an access token and an url to redirect. The client will use these to connect to the SignalR Service.

## Azure SignalR Service with Azure Functions Authorization

To send `x-ms-client-principal-id` header for PlayFab and `x-functions-key` for Azure Functions key the default authenticator can be modified to append these headers in `PrepareRequest`:

```cs
using System;

using Best.SignalR;

namespace Best.SignalR.Authentication
{
    public sealed class AccessTokenAuthenticatorWithAuzreFunctionAuthorization : IAuthenticationProvider
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

        private HubConnection _connection;
        private string _playFabId;
        private string _clientPrincipalId;

        public AccessTokenAuthenticatorWithAuzreFunctionAuthorization(HubConnection connection, string playFabId, string clientPrincipalId)
        {
            this._connection = connection;
            this._playFabId = playFabId;
            this._clientPrincipalId = clientPrincipalId;
        }

        /// <summary>
        /// Not used as IsPreAuthRequired is false
        /// </summary>
        public void StartAuthentication() { }

        /// <summary>
        /// Prepares the request by adding two headers to it
        /// </summary>
        public void PrepareRequest(Best.HTTP.HTTPRequest request)
        {
            // Add Authorization header to http requests, add access_token param to the uri otherwise
            if (Best.HTTP.Hosts.Connections.HTTPProtocolFactory.GetProtocolFromUri(request.CurrentUri) == Best.HTTP.Hosts.Connections.SupportedProtocols.HTTP)
            {
                if (this._connection.NegotiationResult != null)
                    request.SetHeader("Authorization", "Bearer " + this._connection.NegotiationResult.AccessToken);

                if (!string.IsNullOrEmpty(this._playFabId))
                    request.SetHeader("x-ms-client-principal-id", this._playFabId);

                if (!string.IsNullOrEmpty(this._clientPrincipalId))
                    request.SetHeader("x-functions-key", this._clientPrincipalId);
            }
            else
                if (Best.HTTP.Hosts.Connections.HTTPProtocolFactory.GetProtocolFromUri(request.Uri) != Best.HTTP.Hosts.Connections.SupportedProtocols.WebSocket)
                    request.Uri = PrepareUriImpl(request.Uri);
        }

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

        public void Cancel() { }
    }
}
```

And can be used like this:
```cs
var hub = new HubConnection(URL, protocol);
hub.AuthenticationProvider = new AccessTokenAuthenticatorWithAuzreFunctionAuthorization(hub, "<Play Fab ID>", "<Azure Functions Key>");
```