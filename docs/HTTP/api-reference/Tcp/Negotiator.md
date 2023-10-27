---
comments: true
---
# Negotiator

The Negotiator class acts as a central coordinator for the negotiation of network connections, abstracting away the complexities of DNS resolution, TCP socket creation, proxy negotiation, and TLS setup. It allows for customization and extensibility, making it a versatile tool for establishing network connections in a flexible and controlled manner.

- The Negotiator class represents a component responsible for managing the negotiation process. It helps facilitate communication with various network layers, such as DNS resolution, TCP socket creation, proxy handling, and TLS negotiation.
- The class is designed to be flexible and extensible by allowing developers to define a custom negotiation peer that implements the INegotiationPeer interface. This allows developers to adapt the negotiation process to specific requirements and protocols.
- It orchestrates the negotiation process through a series of steps defined by the NegotiationSteps enum. These steps include DNSQuery, TCPRace, Proxy, TLSNegotiation
- Handles errors and exceptions that may occur during negotiation, ensuring graceful fallback or termination of the negotiation process when necessary.
- When TLS negotiation is required, it selects the appropriate TLS negotiation method based on the configuration and available options, such as BouncyCastle or the system's TLS framework.
- If a proxy is configured, the Negotiator class handles proxy negotiation and tunneling, allowing communication through a proxy server.
- It supports cancellation through a CancellationToken, allowing the negotiation process to be canceled if needed.
- The class uses extensive logging to provide information about the progress and outcomes of the negotiation process, making it easier to diagnose and debug issues.



## **Fields**:
### **[INegotiationPeer](INegotiationPeer.md) Peer**
: Gets the negotiation peer associated with this negotiator. 
### **[NegotiationParameters](NegotiationParameters.md) Parameters**
: Gets the negotiation parameters for this negotiator. 
### **[TCPStreamer](TCPStreamer.md) Streamer**
: Gets the TCP streamer associated with this negotiator. 
### **[PeekableContentProviderStream](../Streams/PeekableContentProviderStream.md) Stream**
: Gets the peekable content provider stream associated with this negotiator. 
## **Methods**:

### Void Start()
: Starts the negotiation process. 

### Void OnCancellationRequested()
: Handles cancellation requests during negotiation. 