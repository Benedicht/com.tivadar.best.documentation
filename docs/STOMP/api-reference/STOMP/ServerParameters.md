---
comments: true
---
# ServerParameters

Represents the server parameters negotiated after a successful connection to a STOMP broker. Includes details such as session ID, STOMP protocol version, server information, and heartbeat preferences. 

## **Fields**:
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Id**
: A session identifier that uniquely identifies the client's session. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Version**
: Version of the negotiated STOMP protocol. 
### **[String](https://learn.microsoft.com/en-us/dotnet/api/System.String) Server**
: A field that contains information about the STOMP server. The field MUST contain a server-name field and MAY be followed by optional comment fields delimited by a space octet. 
	!!! note ""
		The server-name field consists of a name token followed by an optional version number token.

### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) PreferredOutgoingHeartbeats**
: Heart-beating can optionally be used to test the healthiness of the underlying TCP connection and to make sure that the remote end is alive and kicking. 
	!!! note ""
		In order to enable heart-beating, each party has to declare what it can do and what it would like the other party to do.  This happens at the very beginning of the STOMP session, by adding a heart-beat header to the CONNECT and CONNECTED frames. represents what the broker can do (outgoing heart-beats): 

		- `0` means it cannot send heart-beats
		- otherwise it is the smallest number of milliseconds between heart-beats that it can guarantee



### **[TimeSpan](https://learn.microsoft.com/en-us/dotnet/api/System.TimeSpan) PreferredIncomingHeartbeats**
: Heart-beating can optionally be used to test the healthiness of the underlying TCP connection and to make sure that the remote end is alive and kicking. 
	!!! note ""
		In order to enable heart-beating, each party has to declare what it can do and what it would like the other party to do.  This happens at the very beginning of the STOMP session, by adding a heart-beat header to the CONNECT and CONNECTED frames. Represents what the broker would like to get(incoming heart-beats): 

		- `0` means it does not want to receive heart-beats
		- otherwise it is the desired number of milliseconds between heart-beats



### **[Dictionary](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Generic.Dictionary-2)&lt;[String](https://learn.microsoft.com/en-us/dotnet/api/System.String), [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)&gt; Headers**
: All headers received from the server. 