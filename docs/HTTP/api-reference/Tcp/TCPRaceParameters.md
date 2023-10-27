---
comments: true
---
# TCPRaceParameters

Contains parameters and settings for a TCP race competition to establish connections. 

## **Fields**:
### **DNSIPAddress[] Addresses**
: An array of DNS IP addresses to be used for racing to establish a connection. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Hostname**
: The hostname to connect to. 
### **[Int32](https://learn.microsoft.com/en-us/dotnet/api/System.Int32) Port**
: The port to connect to. 
### **[CancellationToken](https://learn.microsoft.com/en-us/dotnet/api/System.Threading.CancellationToken) Token**
: The cancellation token used to cancel the TCP race competition. 
### **[Action](https://learn.microsoft.com/en-us/dotnet/api/System.Action-2)&lt;[TCPRaceParameters](), [TCPRaceResult](TCPRaceResult.md)&gt; AnnounceWinnerCallback**
: A callback function to announce the winner of the TCP race competition. 
### **[LoggingContext](../Logger/LoggingContext.md) Context**
: Optional context for logging and tracking purposes. 
### **[Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object) Tag**
: A user-defined tag associated with the TCP race parameters. 