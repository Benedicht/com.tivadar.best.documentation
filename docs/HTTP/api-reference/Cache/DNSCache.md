---
comments: true
---
# DNSCache

The DNSCache class is a static utility that manages DNS caching and queries within the Best HTTP library. It helps improve network efficiency by caching DNS query results, reducing the need for redundant DNS resolutions. 

**Remarks:**

By utilizing the DNSCache class and its associated features, you can optimize DNS resolution in your network communication, leading to improved performance and reduced latency in your applications.

 Its key features include: 

- **Improving Network Efficiency**: The DNSCache class is designed to enhance network efficiency by caching DNS query results. When your application needs to resolve hostnames to IP addresses for making network requests, the DNSCache stores previously resolved results. This reduces the need for redundant DNS resolutions, making network communication faster and more efficient. 
- **DNS Prefetching**: You can use the DNSCache to initiate DNS prefetch operations. Prefetching allows you to resolve and cache DNS records for hostnames in advance, reducing latency for future network requests. This is particularly useful when you expect to make multiple network requests to the same hostnames, as it helps to avoid DNS resolution delays. 
- **Marking IP Addresses as Non-Working**: In cases where a previously resolved IP address is determined to be non-functional (e.g., due to network issues), you can use the DNSCache to report IP addresses as non-working. This information helps the cache make better decisions about which IP addresses to use for future network connections. [TCPRingmaster](../Tcp/TCPRingmaster.md) gives higher priority for adresses not marked as non-working. 
- **Clearing the DNS Cache**: If you need to reset the DNS cache and remove all stored DNS resolutions, you can use the Clear method provided by the DNSCache class. This operation can be useful in scenarios where you want to start with a fresh cache. 
- **Performing DNS Queries**: The primary function of the DNSCache class is to perform DNS queries with specified parameters. It resolves DNS records for a given hostname and caches the results. This can be called directly or used internally by the Best HTTP library for resolving hostnames. 
- **Configuring Cache Behavior**: You can configure the behavior of the DNS cache using the DNSCacheOptions class. This includes setting refresh intervals for cache entries, defining the granularity of cancellation checks for DNS queries, and specifying the frequency of cache maintenance. 



## **Fields**:
### **Options**
: Options for configuring the DNS cache behavior, including refresh intervals and maintenance frequency. 
## **Methods**:

### **Prefetch**
: Initiates a DNS prefetch operation for the specified host name. DNS prefetching is used to resolve and cache DNS records for host names in advance, reducing latency for future network requests. 

### **ReportAsNonWorking**
: Reports an IP address as non-working for the specified host name. In cases where a previously resolved IP address is determined to be non-functional, this method updates the cache to mark the IP address as non-working. 

### **Clear**
: Clears the DNS cache, removing all cached DNS records. This operation can be used to reset the cache and remove all stored DNS resolutions. 

### **Query**
: Performs a DNS query with the specified parameters. It resolves DNS records for a given host name, caching the results to reduce the need for redundant DNS resolutions. 