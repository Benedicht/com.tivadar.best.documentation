---
comments: true
---
# TransportEvents

States that a transport can goes trough as seen from 'outside'. 

## **Fields**:
### **TransportEvents.SelectedToConnect**
: Transport is selected to try to connect to the server 
### **TransportEvents.FailedToConnect**
: Transport failed to connect to the server. This event can occur after SelectedToConnect, when already connected and an error occurs it will be a ClosedWithError one. 
### **TransportEvents.Connected**
: The transport successfully connected to the server. 
### **TransportEvents.Closed**
: Transport gracefully terminated. 
### **TransportEvents.ClosedWithError**
: Unexpected error occured and the transport can't recover from it. 