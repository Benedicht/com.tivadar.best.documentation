# NegotiationResult

Negotiation result of the /negotiation request. https://github.com/dotnet/aspnetcore/blob/master/src/SignalR/docs/specs/TransportProtocols.md#post-endpoint-basenegotiate-request

## **Fields**:
### **ConnectionToken**
: The connectionToken which is required by the Long Polling and Server-Sent Events transports (in order to correlate sends and receives). 
### **ConnectionId**
: The connectionId which is required by the Long Polling and Server-Sent Events transports (in order to correlate sends and receives). 
### **SupportedTransports**
: The availableTransports list which describes the transports the server supports. For each transport, the name of the transport (transport) is listed, as is a list of "transfer formats" supported by the transport (transferFormats) 
### **Url**
: The url which is the URL the client should connect to. 
### **AccessToken**
: The accessToken which is an optional bearer token for accessing the specified url. 
### **NegotiationResponse**
: The [HTTPResponse](../HTTP/HTTPResponse.md) instance the negotiation-response received with. 