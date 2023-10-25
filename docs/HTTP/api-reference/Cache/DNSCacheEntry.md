---
comments: true
---
# DNSCacheEntry

Represents a cached entry for DNS query results, including resolved IP addresses and metadata. 

**Remarks:**

Almost immutable, all changes are done in-class in a thread-safe manner. 

## **Fields**:
### **Key**
: Gets the 128-bit hash derived from the host name. 
### **Host**
: Gets the host name this entry stores the IP addresses for. 
### **ResolvedAt**
: Gets the timestamp when the entry was last resolved. 
### **LastUsed**
: Gets the timestamp when the entry was last used by calling [GetAddresses](DNSCacheEntry.md#getaddresses). 
### **_resolvedAddresses**
: Resolved IP addresses. It's private, accesible through the [GetAddresses](DNSCacheEntry.md#getaddresses) call only. 
### **_isRefreshing**
: Flag that is set to `true` when the cache is refreshing this host. 
	!!! note ""
		When set to `true`, [IsStalled](DNSCacheEntry.md#isstalled) will always return as non-stalled. 

## **Methods**:

### **#ctor**
: Initializes a new instance of the DNSCacheEntry class. 

### **DeriveWith**
: Called to clone the entry. The new entry will inherit the last used timestamp. 

### **IsStalled**
: Checks if the entry is stalled and needs to be refreshed. 
	!!! note ""
		The entry is considered stalled if it is not currently being refreshed (i.e., [_isRefreshing](DNSCacheEntry.md#_isrefreshing) is false) and the time since the last resolution exceeds the refresh interval specified in [RefreshAfter](DNSCacheOptions.md#refreshafter). 


### **IsReadyToRemove**
: Checks if the entry is ready to be removed from the cache. 
	!!! note ""
		The entry is considered ready for removal if the time since it was last used exceeds the removal interval specified in [RemoveAfter](DNSCacheOptions.md#removeafter). 


### **Refresh**
: Refreshes the entry by initiating a DNS prefetch (by calling [Prefetch](DNSCache.md#prefetch)) for the associated host name. 
	!!! note ""
		This method initiates a DNS prefetch operation for the host name associated with this entry. DNS prefetching is used to resolve and cache DNS records for host names in advance, reducing latency for future network requests. 


### **GetAddresses**
: Gets the resolved IP addresses associated with this entry. 
	!!! note ""
		This method returns the resolved IP addresses associated with this entry and updates the last used timestamp. 


### **ReportNonWorking**
: Reports an IP address as non-working for the specified host name. In cases where a previously resolved IP address is determined to be non-functional, this method updates the cache to mark the IP address as non-working. 
	!!! note ""
		This method is used to report an IP address associated with a host name as non-working. When a previously resolved IP address is determined to be non-functional, this method updates the cache to mark the IP address as non-working. It can be useful in situations where network errors or issues with specific IP addresses need to be recorded and managed. 
