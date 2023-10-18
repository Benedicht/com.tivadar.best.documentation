# INegotiationPeer

Interface for a peer that participates in the negotiation process. 


## **Methods**:

### **GetSupportedProtocolNames**
: Gets the list of supported ALPN protocol names for negotiation. 

### **MustStopAdvancingToNextStep**
: Indicates whether the negotiation process must stop advancing to the next step. 

### **EvaluateProxyNegotiationFailure**
: Handles the evaluation of a proxy negotiation failure. 

### **OnNegotiationFailed**
: Handles the negotiation failure. 

### **OnNegotiationFinished**
: Handles the successful completion of negotiation. 