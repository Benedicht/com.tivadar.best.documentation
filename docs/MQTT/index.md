---
comments: true
---

# Best MQTT

Welcome to the Best MQTT Documentation!
Best MQTT is a premier Unity networking library, purpose-built for the seamless integration of the [MQTT protocol](https://mqtt.org/). 
Ideal for dynamic real-time experiences like IoT device communication, messaging systems, and live data streams.

!!! Warning "**Dependency Alert**"
    Best MQTT depends on both the **Best HTTP** and **Best WebSockets** packages! 
    Ensure you've installed and configured both these packages in your Unity project before diving into Best MQTT. 
    Explore more about the [installation of Best HTTP](../HTTP/installation.md) and [Best WebSockets](../WebSockets/installation.md).

!!! Warning
    Keep in mind that Best MQTT here is a **client-side implementation**. If you're looking to set up the server-side or need server-specific details,  you'll need to explore server-side implementations and libraries specific to your programming language and platform.
    
    Always ensure you're implementing the right component for your needs!

## Overview
In today's interconnected world, real-time data exchange is integral to numerous applications, from IoT device communication to instant messaging. 

**MQTT**, or Message Queuing Telemetry Transport, is a highly efficient publish/subscribe messaging transport protocol. 
It's lightweight, making it perfect for communication where bandwidth is a concern.
Unlike the traditional request-response model, MQTT operates on a publisher-subscriber model, ensuring real-time data delivery with minimal overhead.

Best MQTT makes the task of integrating this powerful protocol into your Unity projects straightforward. 
It's optimized for strong bi-directional communication, ensuring your users benefit from a responsive and live data exchange experience.

<!--[Buy Now on :fontawesome-brands-unity: Asset Store](https://assetstore.unity.com/packages/slug/268762?aid=1101lfX8E){ .md-button .md-button--primary }-->
[Smart Choice: Choose the Bundle, Save {{ bundles.MQTT_off }}%!](https://assetstore.unity.com/packages/slug/268837?aid=1101lfX8E){ .md-button .md-button--primary }

## Key Features
- **Supported Unity Versions:** Compatible with Unity versions starting from :fontawesome-brands-unity: **2021.1 onwards**.
- **Compatibility with MQTT:** Aligns with the latest versions of MQTT, placing cutting-edge messaging capabilities in your hands.
- **Cross-Platform Mastery:** Operates smoothly across a spectrum of Unity-supported platforms, making it versatile for a wide range of projects. Specifically, it supports:
    - :fontawesome-solid-desktop: **Desktop:** Windows, Linux, MacOS
    - :fontawesome-solid-mobile:  **Mobile:** iOS, Android
    - :material-microsoft-windows: **Universal Windows Platform (UWP)**
    - :material-web: **Web Browsers:** WebGL
	- Furthermore, user reports suggest that Best MQTT also functions on the following platforms. However, due to the lack of testing capabilities, official support for these platforms is not provided:
		- :fontawesome-brands-xbox: Xbox
		- :fontawesome-brands-playstation: PlayStation
		- :simple-nintendoswitch: Nintendo Switch
		
		Please note that while there is evidence of compatibility with these platforms, I'm unable to offer official support or guarantee full functionality due to testing limitations.

    With such broad platform coverage, this library emerges as a top choice for various platform needs.

- **Seamless Integration:** With intuitive APIs and comprehensive documentation, integrating into any Unity project becomes straightforward.
- **Performance Optimized:** Engineered for top-tier performance, ensuring swift data transfers ideal for real-time scenarios.
- **Extensive Protocol Version Support:** Whether you're using **MQTT v3.1.1, or v5.0**, Best MQTT has got you covered.
- **Lightweight and Efficient:** Minimized overheads make it perfect for scenarios with constrained bandwidth.
- **Bi-directional Communications:** Engage in two-way data exchanges effortlessly, enhancing application responsiveness.
- **Efficient Message Handling:** Ensures messages reach their intended recipients due to its robust delivery mechanisms. With support for **QoS 0, 1, and 2**, you can decide the level of message delivery assurance you need.
- **Last Will:** Define messages to be sent out if your client unexpectedly disconnects.
- **Topic Subscriptions:** Manage your MQTT subscriptions smoothly, defining channels suited to your application needs. Includes support for MQTT **wildcard** topic subscriptions, allowing for more flexible and dynamic topic monitoring.
- **Event-Driven Communication:** Capitalize on event-based communication paradigms to keep your applications engaging and current.
- **Secure Communications:** With built-in TLS support, your messages remain encrypted and secure.
- **Profiler Integration:** Leverage the comprehensive [Best HTTP profiler](../Shared/profiler/index.md) integration:
    - **Memory Profiler:** Assess memory usage patterns and pinpoint potential memory bottlenecks.
    - **Network Profiler:** Monitor network behavior, analyzing data transfers, connection health, and more.
- **Customizable:** Extensive configuration options ensure Best MQTT fits precisely into your project's needs.
- **Debugging and Logging:** Robust logging tools assist developers in understanding the library's workings and facilitate debugging.

<!--[Buy Now on :fontawesome-brands-unity: Asset Store](https://assetstore.unity.com/packages/slug/268762?aid=1101lfX8E){ .md-button .md-button--primary }-->
[Smart Choice: Choose the Bundle, Save {{ bundles.MQTT_off }}%!](https://assetstore.unity.com/packages/slug/268837?aid=1101lfX8E){ .md-button .md-button--primary }

## Documentation Sections
Embark on your Best MQTT journey:

- [Installation Guide:](installation.md) Begin with Best MQTT, get the package set up, and tailor your Unity environment.
- [Upgrade Guide:](upgrade-guide.md) Upgrading from an older version? Familiarize yourself with the latest enhancements and streamline your upgrade process.
- [Getting Started:](getting-started/index.md) Launch your MQTT adventure, master the fundamentals, and mold Best MQTT to your project's core.
- [Advanced Topics:](intermediate-topics/optimization_tips_tricks.md) Dive into intricate MQTT aspects, spanning from event handling to advanced messaging strategies.

This documentation is designed for developers of all backgrounds and expertise. 
Whether you're a Unity novice or a seasoned expert, these guides are here to help you harness the full potential of Best MQTT.

Dive in and supercharge your Unity projects with unmatched real-time messaging capabilities using Best MQTT!
