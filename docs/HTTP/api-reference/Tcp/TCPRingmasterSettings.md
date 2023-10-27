---
comments: true
---
# TCPRingmasterSettings

Contains settings related to TCP Ringmaster, which manages and optimizes TCP connections. 

## **Fields**:
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) MaxSimultaneousRacers**
: The maximum number of simultaneous TCP racers. Racers are used to establish and manage connections. 
### **[Boolean](https://learn.microsoft.com/en-us/dotnet/api/System.Boolean) ShuffleAddresses**
: Determines whether to shuffle addresses before assigning racing lanes. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-1)&lt;[TCPRaceParameters](TCPRaceParameters.md)&gt; CustomAddressShuffleAlgorithm**
: Callback to implement a custom address shuffle algorithm. When assigned, no plugin-defined shuffle algorithm will be executed. 
	!!! note ""
		It must be thread-safe.

### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) CancellationCheckingGranularity**
: The granularity of cancellation checking for TCP races. It specifies the time interval for checking if a race should be canceled. 