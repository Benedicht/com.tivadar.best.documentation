---
comments: true
---
# TransportEvents

States that a transport can goes trough as seen from 'outside'. 

## **Fields**:
### **SelectedToConnect**
: Transport is selected to try to connect to the server 
### **FailedToConnect**
: Transport failed to connect to the server. This event can occur after SelectedToConnect, when already connected and an error occurs it will be a ClosedWithError one. 
### **Connected**
: The transport successfully connected to the server. 
### **Closed**
: Transport gracefully terminated. 
### **ClosedWithError**
: Unexpected error occured and the transport can't recover from it. 