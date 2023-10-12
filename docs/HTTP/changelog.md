# Changelog

## 3.0.0 (2023-01-01)

__Additions and improvements__

- New namespace hierarchy.
- Added `DNSCache` implementation to speed up consecutive connection processes.
- Added support for DNSCache to manually store and retrieve entries.
- Added new `Negotiator` class help building new plugins that doesn't use HTTP, but require the same lower-level infrastructure.
- Added new `TCPRingmaster` class to speed up TCP connection process by sending out multiple tcp connection requests and use the first connected one.
- Reimplemented connection logic to use the new DNS cache, negotiator and tcp-ringmaster.
- Reimplemented `HTTPCache`.
- (#69) Now it's possible and easy to populate the local HTTP cache.
- Added new, cleaner samples for both old and new features.

__Removals__

- Removed old, cluttered samples.

__Fixes__

- Fixed chaos around different upload sources (RawData, Forms, UploadStream) and unified them in one `UploadStream`.