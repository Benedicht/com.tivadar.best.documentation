---
comments: true
---

# Changelog

## 3.1.0 (2026-10-29)

__Additions and improvements__

- Session tickets are persisted in `TLSSecurity.SessionTickets` and assigned to `HTTPManager.TlsSessionTicketStore` during setup
- `SecurityOptions.AdvertiseCertificateCompression` (default `true`) advertises zlib certificate compression in the ClientHello
- `SecurityOptions.OfferPostHandshakeAuth` sends `post_handshake_auth` when the host has a client certificate
- `SecurityOptions.CertificateStorePreference` (default `PluginFirst`) chooses which certificate store builds the server chain. `PluginOnly` and `SystemOnly` use a single store. `PluginFirst` and `SystemFirst` try that store first and fall back to the other when it cannot build a chain.
- Updated Root and Intermediate certifications

__Fixes__

- (#229) In-memory database cache entries are removed when their disk offset is freed or overwritten
- Updated the Certification Manager's Mozilla CCADB download URLs

## 3.0.4 (2025-05-14)

__Fixes__

- Fixed failing requests when no OCSP endpoint is found in the certificate's AuthorityInformationAccess extension

__Additions and improvements__

- Updated Root and Intermediate certifications.

## 3.0.3 (2025-03-02)

__Additions and improvements__

- Filter out expired certificates after certificate matching.
- Updated certificates.

## 3.0.2 (2024-09-09)

__Additions and improvements__

- Switched to the new [UTC date&times](../HTTP/changelog.md)

## 3.0.1 (2024-05-20)

__Additions and improvements__

- Updated Root and Intermediate certifications.
- Removed `sealed` modifier from the `SecureTlsClient`.
- Added support to validate certifications with IP addresses in their SubjectAlternativeName.
- Updated author url field in the package.
- Removed Burst dependency from the package.

## 3.0.0 (2023-11-01)

__Additions and improvements__

- Now uses the Best HTTP package and all of its relevant features.
