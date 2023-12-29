---
comments: true
---

# Best STOMP

Welcome to the Best STOMP Documentation!
Best STOMP is a top-tier Unity networking library designed for easy and efficient integration of the [STOMP protocol](https://stomp.github.io/). 
Perfect for applications requiring real-time messaging, such as chat systems, live updates, and interactive collaboration tools.

!!! Warning "**Dependency Alert**"
    Best STOMP relies on the **Best HTTP** and **Best WebSockets** packages! 
    Ensure these packages are installed and configured in your Unity project before using Best STOMP. 
    Learn more about the [installation of Best HTTP](../HTTP/installation.md) and [Best WebSockets](../WebSockets/installation.md).

!!! Warning
    Note that Best STOMP is a **client-side implementation**. For server-side functionalities, you'll need server-specific libraries and tools according to your programming language and platform.
    
    Ensure you're implementing the appropriate components for your project needs!

## Overview
In an era where instant and real-time communication is crucial, efficient messaging protocols are indispensable. 

**STOMP**, or Simple Text Oriented Messaging Protocol, is a straightforward, text-based messaging protocol for use with message brokers. 
It's versatile and language-agnostic, making it ideal for diverse applications, including chat systems, live updates, and collaborative environments.

Best STOMP brings the power and simplicity of the STOMP protocol into your Unity projects with ease. 
It focuses on providing robust messaging capabilities while maintaining a lightweight footprint, ensuring efficient real-time communication.

<!--[Smart Choice: Get the Best STOMP Bundle now, available on the Unity Asset Store at {{ bundles.STOMP_off }}% off!](https://assetstore.unity.com/packages/slug/272040?aid=1101lfX8E){ .md-button .md-button--primary }-->

## Key Features
- **Unity Compatibility:** Works seamlessly with Unity versions :fontawesome-brands-unity: **2021.1 and newer**.
- **STOMP Protocol Support:** Fully compatible with the latest STOMP v1.2 protocol, offering a versatile messaging solution.
- **Cross-Platform Compatibility:** Operates smoothly across a spectrum of Unity-supported platforms, making it versatile for a wide range of projects. Specifically, it supports:
    - :fontawesome-solid-desktop: **Desktop:** Windows, Linux, MacOS
    - :fontawesome-solid-mobile:  **Mobile:** iOS, Android
    - :material-microsoft-windows: **Universal Windows Platform (UWP)**
    - :material-web: **Web Browsers:** WebGL
	  - Furthermore, user reports suggest that Best STOMP also functions on the following platforms. However, due to the lack of testing capabilities, official support for these platforms is not provided:
		  - :fontawesome-brands-xbox: Xbox
		  - :fontawesome-brands-playstation: PlayStation
		  - :simple-nintendoswitch: Nintendo Switch
		
		  Please note that while there is evidence of compatibility with these platforms, I'm unable to offer official support or guarantee full functionality due to testing limitations.

    Broad platform support makes Best STOMP ideal for diverse project requirements.

- **Easy Integration:** User-friendly APIs and detailed documentation simplify integration into any Unity project.
- **Optimized Performance:** Designed for high-speed, low-latency messaging, crucial for real-time applications.
- **Flexible Messaging:** Supports both text and binary-based messaging with options for custom headers and content types.
- **TCP and WebSocket Transport Support:** Offers flexible connectivity options with support for both TCP and WebSocket transports, catering to diverse network requirements and scenarios.
- **TLS for All Transports:** Ensures secure communication by enabling TLS encryption for both TCP and WebSocket connections, safeguarding data integrity and privacy.
- **Async-Await and Event-Driven Architecture:** Harness the power of C#'s async-await pattern for asynchronous operations, alongside event-based communication, to build dynamic and responsive applications.
- **Support for STOMP's Transactions:** Implement transactional messaging as defined in the STOMP protocol, providing reliable and consistent message handling and exchange.
- **Versatile Acknowledgment Modes:** Supports **'auto'**, **'client'**, and **'client-individual'** acknowledgment modes, providing flexibility in message acknowledgment strategies to suit various application needs.
- **Advanced Subscription Handling:** Manage topic subscriptions with ease, including support for multiple destination subscriptions.
- **Heartbeat Mechanism:** Integrated heartbeat mechanism to maintain active connections and detect connectivity issues, enhancing reliability and stability.
- **Comprehensive Profiler Integration:** Utilize the [Best HTTP profiler](../Shared/profiler/index.md) for in-depth analysis of memory and network performance.
- **Customization Options:** Extensive configuration settings to tailor Best STOMP to your project's needs.
- **Debugging and Logging Tools:** Advanced logging capabilities aid in development and troubleshooting.

<!--[Unlock More for Less: Get the Best STOMP Bundle now and save {{ bundles.STOMP_off }}%!](https://assetstore.unity.com/packages/slug/272040?aid=1101lfX8E){ .md-button .md-button--primary }-->

## Documentation Sections
Explore the world of Best STOMP:

- [Installation Guide:](installation.md) Start your journey with Best STOMP, set up the package, and configure your Unity environment.
- [Getting Started:](getting-started/index.md) Learn the basics of STOMP in Unity, and implement Best STOMP effectively in your projects.

This documentation caters to developers of varying skill levels and backgrounds. 
From Unity beginners to experienced professionals, these guides are crafted to help you leverage the full potential of Best STOMP.

Embark on your real-time messaging adventure with Best STOMP and enhance your Unity projects today!

*[TLS]: Transport Layer Security