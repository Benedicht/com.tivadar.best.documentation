# Changelog

## 3.0.0 (2023-01-01)

- *Added*: `DNSCache` implementation to speed up consecutive connection processes.
- *Added* #69 : support for DNSCache to manually store and retrieve entries.
- *New*: `Negotiator` class help building new plugins that doesn't use HTTP, but require the same lower-level infrastructure.
- *New*: TCPRingmaster class to speed up TCP connection process by sending out multiple tcp connection requests and use the first connected one.
- *Reimplemented*: connection logic to use the new DNS cache, negotiator and tcp-ringmaster.
- *Added*: new local content cache implementation.
- *Fixed*: chaos around different upload sources (RawData, Forms, UploadStream) and unified them in one `UploadStream`.