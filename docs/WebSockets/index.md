---
comments: true
---

# Best WebSockets

Welcome to the Best WebSockets Documentation! Best WebSockets is a premier networking library for Unity, tailored specifically for seamless WebSocket integration. 
It's perfect for applications that require real-time, bi-directional communication such as chat applications, multiplayer games, and live interactive systems.

!!! Warning
	Please be aware that Best WebSockets is a **client-side implementation only**. If you're looking to set up a WebSocket server, you'll need to explore server-side implementations and libraries specific to your programming language and platform.

	Ensure you're deploying the correct component for your needs!

## Overview
In the fast-paced digital landscape, real-time communication is crucial for a multitude of applications. 
Whether it's sending instantaneous game state updates, chat messages, or receiving live feeds, WebSockets provide an edge in facilitating these real-time interactions. 
Best WebSockets is crafted to effortlessly integrate this technology into your Unity projects, making bi-directional communication straightforward and efficient.

## :fontawesome-solid-fire-flame-curved:{.red} Essential Dependency :fontawesome-solid-fire-flame-curved:{.red}
Best WebSockets is built upon and necessarily requires the [Best HTTP package](../HTTP/index.md). 
This foundational package not only provides the core mechanisms for the asset but also bestows its renowned reliability and top-tier performance. 
Before diving into Best WebSockets, ensure the Best HTTP dependency is correctly integrated into your Unity project, guaranteeing a seamless and high-performance networking journey.

<!--[Buy Now on :fontawesome-brands-unity: Asset Store](https://assetstore.unity.com/packages/slug/268757?aid=1101lfX8E){ .md-button .md-button--primary }-->
[{{ bundles.WebSockets_off }}% Off: Maximize Value with the Bundle!](https://assetstore.unity.com/packages/slug/268838?aid=1101lfX8E){ .md-button .md-button--primary }

## Key Features
- **Supported Unity Versions:** Best WebSockets is compatible with Unity versions starting from :fontawesome-brands-unity: **2021.1 onwards**.
- **Cross-Platform:** Best WebSockets seamlessly operates across a wide variety of Unity platforms, ensuring its applicability for diverse development projects. Specifically, it supports:
    
    - :fontawesome-solid-desktop: **Desktop:** Windows, Linux, MacOS
    - :fontawesome-solid-mobile:  **Mobile:** iOS, Android
    - :material-microsoft-windows: **Universal Windows Platform (UWP)**
    - :material-web: **Web Browsers:** WebGL
	- Furthermore, user reports suggest that Best WebSockets also functions on the following platforms. However, due to the lack of testing capabilities, official support for these platforms is not provided:
		- :fontawesome-brands-xbox: Xbox
		- :fontawesome-brands-playstation: PlayStation
		- :simple-nintendoswitch: Nintendo Switch
		
		Please note that while there is evidence of compatibility with these platforms, I'm unable to offer official support or guarantee full functionality due to testing limitations.

    This vast platform compatibility assures that Best WebSockets is an excellent choice for any project, regardless of your target platform or audience.

- **🔥Support for WebSockets Over HTTP/2:** Sharing a single TCP connection for both WebSocket and HTTP requests ensures efficient network resource utilization, reduces connection establishment overhead, and simplifies server-side handling, enhancing overall application responsiveness.
- **Persistent Connections:** Unlike traditional request-response communication, WebSockets offer a persistent, low-latency connection that's perfect for applications that need instant communication.
- **Binary and Text Data:** Whether you're sending textual messages or binary data like images and files, Best WebSockets is equipped to handle both with ease.
- **Secure Communication:** With support for WSS:// (WebSocket over TLS), your application's data remains secure and encrypted.
- **Built-In Profiler Support:** To ensure peak performance and help debug potential issues, Best WebSockets integrates with the base [Best HTTP profiler](../Shared/profiler/index.md):
    - **Memory Profiler:** Examine the library's internal memory usage, helping identify potential bottlenecks or memory leaks.
    - **Network Profiler:** Delve deep into your network operations, monitoring data transfers, open and closed connections, and much more.
- **Custom Protocols:** Easily extend and adapt your WebSocket communication with custom protocols, allowing for versatile application-specific communication styles.
- **Compression:** Data compression capabilities ensure efficient bandwidth usage, leading to faster data transfers and reduced latency.

<!--[Buy Now on :fontawesome-brands-unity: Asset Store](https://assetstore.unity.com/packages/slug/268757?aid=1101lfX8E){ .md-button .md-button--primary }-->
[{{ bundles.WebSockets_off }}% Off: Maximize Value with the Bundle!](https://assetstore.unity.com/packages/slug/268838?aid=1101lfX8E){ .md-button .md-button--primary }

## Documentation Sections
Delve into the details and start using Best WebSockets in your projects:

- [Installation Guide:](installation.md) Kick off with Best WebSockets by setting up the package and configuring your Unity project.
- [Upgrade Guide:](upgrade-guide.md) Transitioning from an earlier version? Find out the latest improvements and how to smoothly upgrade to the most recent release.
- [Getting Started:](getting-started/index.md) Embark on your WebSocket journey, understand the basics, and configure Best WebSockets tailored to your application's needs.
- [Advanced Topics:](intermediate-topics/index.md) Enhance your knowledge with deeper insights into WebSocket topics, like custom protocols, security, and more.

This documentation is designed for developers of all backgrounds and expertise. 
Whether you're new to Unity or a seasoned professional, these guides will assist you in maximizing the capabilities of Best WebSockets.

Dive in now and elevate your Unity projects with superior real-time communication features using Best WebSockets!