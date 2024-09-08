---
comments: true
---

# Changelog

## 1.0.2 (2024-09-09)

__Additions and improvements__

- Switched to the new [UTC date&times](../HTTP/changelog.md)

__Fixes__

- Fixed possible case where the receivedStream might be already null when a websocket message arrives
- Add "login" and "passcode" headers.

## 1.0.1 (2024-01-02)

__Additions and improvements__

- Subscription Acknowledgment callbacks now receive the incoming ack frame too.
- Moved [ConnectParametersBuilder](api-reference/Builders/ConnectParametersBuilder.md) under the `Builders` sub-namespace.

## 1.0.0 (2023-12-30)

Initial release