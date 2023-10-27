---
comments: true
---
# INegotiationPeer

Interface for a peer that participates in the negotiation process. 


## **Methods**:

### [List](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.List-1)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; GetSupportedProtocolNames([Negotiator](Negotiator.md))
: Gets the list of supported ALPN protocol names for negotiation. 

### [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) MustStopAdvancingToNextStep([Negotiator](Negotiator.md), [NegotiationSteps](NegotiationSteps.md), [NegotiationSteps](NegotiationSteps.md), [Exception](https://learn.microsoft.com/en-us/dotnet/api/System.Exception))
: Indicates whether the negotiation process must stop advancing to the next step. 

### Void EvaluateProxyNegotiationFailure([Negotiator](Negotiator.md), [Exception](https://learn.microsoft.com/en-us/dotnet/api/System.Exception), [Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean))
: Handles the evaluation of a proxy negotiation failure. 

### Void OnNegotiationFailed([Negotiator](Negotiator.md), [Exception](https://learn.microsoft.com/en-us/dotnet/api/System.Exception))
: Handles the negotiation failure. 

### Void OnNegotiationFinished([Negotiator](Negotiator.md), [PeekableContentProviderStream](../Streams/PeekableContentProviderStream.md), [TCPStreamer](TCPStreamer.md), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String))
: Handles the successful completion of negotiation. 