# Best TLS Security

Welcome to the Best TLS Security Documentation! 
Best TLS Security is a paramount security library for Unity, intricately designed for solid Transport Layer Security (TLS) implementation. 
Enhancing the security of the Best suite of packages (including [HTTP](https://assetstore.unity.com/packages/slug/267636?aid=1101lfX8E), [Socket.IO](https://assetstore.unity.com/packages/slug/268759?aid=1101lfX8E), [WebSockets](https://assetstore.unity.com/packages/slug/268757?aid=1101lfX8E), [SignalR](https://assetstore.unity.com/packages/slug/268760?aid=1101lfX8E) and [Server-Sent Events](https://assetstore.unity.com/packages/slug/268758?aid=1101lfX8E)), 
it's ideal for applications necessitating strict security measures, ensuring data confidentiality, integrity, and authentication.

!!! Warning "Dependency Alert"
    Best TLS Security is built upon the foundations of the Best HTTP package and is designed to enhance the security of the entire Best suite of packages!
    Ensure the Best HTTP package is installed and configured in your Unity project before diving into Best TLS Security. Learn more about the installation of Best HTTP.

## Overview
In today's digital age, safeguarding data is of paramount importance. 
Best TLS Security arms your Unity projects with state-of-the-art security protocols, making data exchanges robust against threats.

[Buy Now on :fontawesome-brands-unity: Asset Store](https://assetstore.unity.com/packages/slug/268761?aid=1101lfX8E){ .md-button .md-button--primary }

## Key Features
- **Supported Unity Versions:** Best WebSockets is compatible with Unity versions starting from :fontawesome-brands-unity: **2021.1 onwards**.
- **Cross-Platform:** Best WebSockets seamlessly operates across a wide variety of Unity platforms, ensuring its applicability for diverse development projects. Specifically, it supports:
    
    - :fontawesome-solid-desktop: **Desktop:** Windows, Linux, MacOS
    - :fontawesome-solid-mobile:  **Mobile:** iOS, Android
    - :material-microsoft-windows: **Universal Windows Platform (UWP)**

    !!! Note
        The Best TLS Security package does not function under WebGL. 
        When deploying to this platform, the underlying browser handles communication responsibilities, ensuring established security protocols are adhered to.

- **Certificate Chain Verification:** Adheres to [RFC 3280](https://tools.ietf.org/html/rfc3280), offering meticulous certificate chain verification.
- **Revocation Checking:** Checks the validity of leaf certificates using OCSP. Both soft and hard fail options available.
- **OCSP Response Management:** Efficiently caches OCSP responses and supports OCSP Must-Staple.
- **Certification Manager Window:** An intuitive interface to manage Trusted Root CA, Trusted Intermediate, and Client Credentials. Use the window to:
    - Update all certificates from a trusted source
    - Incorporate custom certificates
    - Remove non-essential certificates
- **Domain Name Matching:** Ensures authenticity by verifying domain names.
- **Client Authentication:** Provides an additional layer of security by verifying client identity.
- **Versatile Configuration:** A plethora of options to finetune every facet of the add-on to your specific needs.

[Buy Now on :fontawesome-brands-unity: Asset Store](https://assetstore.unity.com/packages/slug/268761?aid=1101lfX8E){ .md-button .md-button--primary }

## Documentation Sections

Explore Best TLS Security's features and enhance your Unity project's security:

- **Installation Guide:** Start with Best TLS Security by setting up the package and tailoring it to your Unity project.
- **Upgrade Guide:** Migrating from a previous version? Discover the recent enhancements and seamlessly upgrade to the newest release.
- **Getting Started:** Dive deep into TLS protocols, learn the basics, and customize Best TLS Security for optimal performance.
- **Advanced Topics:** Delve further into security realms, exploring subjects like client authentication, domain name matching, and more.

This documentation caters to developers across all expertise levels. Whether you're a novice or a seasoned developer, these guides will empower you to harness the full potential of Best TLS Security.

Embark on your security journey and fortify your Unity projects with the unparalleled protective features of Best TLS Security!

*[TLS]: Transport Layer Security
*[OCSP]: Online Certificate Status Protocol