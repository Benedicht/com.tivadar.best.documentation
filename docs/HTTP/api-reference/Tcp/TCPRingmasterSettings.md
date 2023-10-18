# TCPRingmasterSettings

Contains settings related to TCP Ringmaster, which manages and optimizes TCP connections. 

## **Fields**:
### **MaxSimultaneousRacers**
: The maximum number of simultaneous TCP racers. Racers are used to establish and manage connections. 
### **ShuffleAddresses**
: Determines whether to shuffle addresses before assigning racing lanes. 
### **CustomAddressShuffleAlgorithm**
: Callback to implement a custom address shuffle algorithm. When assigned, no plugin-defined shuffle algorithm will be executed. 
	!!! note ""
		It must be thread-safe.

### **CancellationCheckingGranularity**
: The granularity of cancellation checking for TCP races. It specifies the time interval for checking if a race should be canceled. 