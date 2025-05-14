---
comments: true
---

# Changelog

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