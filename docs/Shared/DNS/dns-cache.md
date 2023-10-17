---
comments: true
---

# Understanding DNS in general and the DNS Cache in the Best HTTP Library

## What is DNS?
Domain Name System (DNS) is a foundational technology responsible for resolving human-readable hostnames into IP addresses, allowing systems to communicate with one another over the internet. 
For instance, when you enter a URL (like "www.google.com") into a web browser, DNS translates it to an IP address to locate and connect to the website's server.

### Why is DNS Important?
DNS is critical for various reasons:

1. **Human-friendly Communication:** Without DNS, users would need to memorize and enter IP addresses (like 192.0.2.44) instead of easily remembered names (like "www.example.com").
2. **Connection Speed:** DNS resolution plays a pivotal role in determining how quickly users can connect to a desired server.
3. **Internet Infrastructure:** DNS provides a global directory service, ensuring the seamless functioning of the internet.

## DNS Cache in Best HTTP Library
To optimize and improve the speed of DNS resolutions, the Best HTTP library implements a DNS cache system. 
This system temporarily stores DNS query results, reducing the need for repeated resolutions and enhancing network efficiency.

### Key Features
The `DNSCache` class in the Best HTTP library offers:

- **Efficiency Improvements:** By caching DNS query results, redundant resolutions are minimized, speeding up network communication.
- **DNS Prefetching:** Resolves and caches DNS records in advance, reducing future network request latency.
- **Non-Working IP Address Reporting:** Allows marking specific IP addresses as non-functional, helping the cache make better decisions for future connections.
- **Cache Reset:** Facilitates the removal of all stored DNS resolutions, giving an option for a fresh start.
- **Custom DNS Queries:** Directly resolves DNS records for specified hostnames and caches the results.
- **Cache Behavior Configuration:** Uses the DNSCacheOptions class to set cache behavior parameters, including refresh intervals and cancellation check granularity.
- **Benefit for Protocols/Packages:** All protocols and packages built on top of the Best HTTP library automatically benefit from this DNS cache system, ensuring consistently fast connections across the board.

### How to Use the DNSCache Class

!!! note "All protocols and packages built on top of Best HTTP automatically utilize the `DNSCache`, eliminating the need for any additional setup or calls!"

Here's a brief guide on how to use the `DNSCache` class:

```cs title="Prefetch DNS Records"
DNSCache.Prefetch("www.example.com");
```

```cs title="Report Non-Working IP Addresses"
IPAddress nonWorkingAddress = IPAddress.Parse("192.0.2.44");
DNSCache.ReportAsNonWorking("www.example.com", nonWorkingAddress, loggingContext);
```

```cs title="Clear the DNS Cache"
DNSCache.Clear();
```

```cs title="Initiate a DNS Query"
Uri address = new Uri("http://www.example.com");
DNSQueryParameters parameters = new DNSQueryParameters(address);
parameters.Callback = (@param, result) => Debug.Log($"Number of IP addresses found for hostname('{result.HostName}'): {result.Addresses?.Length}");

DNSCache.Query(parameters);
```

By leveraging the features of the `DNSCache` class, developers can ensure efficient DNS resolutions, thus improving network performance in their applications.

## Conclusion

While DNS is just one part of the entire web connection process, it plays a pivotal role. 
A well-optimized DNS system can significantly boost connection speeds, reduce latency, and provide a smoother internet browsing experience. 
However, it's also important to note that while DNS can help in speeding up the initial connection, the overall speed of data transfer will also depend on other factors like bandwidth, server health, and network conditions.