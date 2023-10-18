# TCPRingmaster

TCPRingmaster provides a method called [StartCompetion](../Tcp/TCPRingmaster.md#startcompetion), which is used to initiate a competition among multiple TCP connections. Each connection attempt races against the others to establish a connection, and the first successful connection is considered the winner. The class allows to specify a callback function (through [AnnounceWinnerCallback](../TCPRaceParameters/.md#announcewinnercallback)) that gets invoked when a winning connection is established or when the competition is canceled. This callback can be used to take action based on the competition outcome. 

Additionally it includes logic for optimizing the order in which connection attempts are made: 

- It can shuffle the order of addresses to improve the chances of quickly finding a working address.
- It handles scenarios where some addresses may not be working and prioritizes working addresses.




## **Methods**:

### **StartCompetion**
: Starts a TCP race competition to establish connections based on the provided parameters. 