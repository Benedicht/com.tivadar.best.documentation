---
comments: true
---
# NegotiationResult

Negotiation result of the /negotiation request. https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/TransportProtocols.md#post-endpoint-basenegotiate-request

## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) ConnectionToken**
: The connectionToken which is required by the Long Polling and Server-Sent Events transports (in order to correlate sends and receives). 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) ConnectionId**
: The connectionId which is required by the Long Polling and Server-Sent Events transports (in order to correlate sends and receives). 
### **[List](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List-1)&lt;[SupportedTransport](SupportedTransport.md)&gt; SupportedTransports**
: The availableTransports list which describes the transports the server supports. For each transport, the name of the transport (transport) is listed, as is a list of "transfer formats" supported by the transport (transferFormats) 
### **[Uri](https://learn.microsoft.com/en-us/dotnet/api/System.Uri) Url**
: The url which is the URL the client should connect to. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) AccessToken**
: The accessToken which is an optional bearer token for accessing the specified url. 
### **[HTTPResponse](../../../HTTP/api-reference/HTTP/HTTPResponse.md) NegotiationResponse**
: The [HTTPResponse](../../../HTTP/api-reference/HTTP/HTTPResponse.md) instance the negotiation-response received with. 