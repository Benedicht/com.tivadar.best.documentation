# Best SignalR

Welcome to the Best SignalR Documentation! Best SignalR is a leading Unity networking library, engineered for seamless integration of the [SignalR technology](https://learn.microsoft.com/en-us/aspnet/core/signalr/introduction). 
Perfect for dynamic real-time experiences like online multiplayer games, chat systems, and live interactive dashboards.

!!! Warning "**Dependency Alert**"
    Best SignalR depends on both the **Best HTTP** and **Best WebSockets** packages! 
    Ensure you've installed and configured both these packages in your Unity project before diving into Best SignalR. 
    Explore more about the [installation of Best HTTP](../HTTP/installation.md) and [Best WebSockets](../WebSockets/installation.md).

## Overview
In the modern digital realm, real-time interactions have become a cornerstone for a multitude of applications.
From real-time game updates to live chat systems, the importance of instantaneous communication cannot be overstated. 

**SignalR** is a groundbreaking technology developed by Microsoft. It facilitates adding real-time web functionality to applications.
Unlike traditional request-response models, SignalR allows the server to push content to connected clients instantly as it becomes available.
This ensures that the application is always updated in real time. 
SignalR provides a simple API for creating server-to-client remote procedure calls (RPC) that calls functions in client applications from server-side .NET core code. 
Moreover, SignalR takes care of all the complexities involved in real-time communications, such as connection management, data serialization, and many more.

Best SignalR simplifies the process of integrating this innovative technology into your Unity projects.
It's tailored to ensure robust and efficient bi-directional communication, providing your users with a dynamic and responsive application experience.

## Key Features
- **Supported Unity Versions:** Best SignalR is compatible with Unity versions starting from :fontawesome-brands-unity: **2021.1 onwards**.
- **Compatibility with SignalR:** Best SignalR is fully aligned with the latest version of SignalR, equipping you with the forefront of real-time communication tools.
- **Cross-Platform Mastery:** Best SignalR seamlessly operates across a wide range of Unity-supported platforms, ensuring its applicability for diverse development projects. Specifically, it supports:

    - :fontawesome-solid-desktop: **Desktop:** Windows, Linux, MacOS
    - :fontawesome-solid-mobile:  **Mobile:** iOS, Android
    - :material-microsoft-windows: **Universal Windows Platform (UWP)**
    - :material-web: **Web Browsers:** WebGL

    With such expansive platform coverage, Best SignalR emerges as the top choice for your diverse platform needs and audience.

- **Seamless Integration:** With user-friendly APIs and detailed documentation, weaving Best SignalR into any Unity project is a cinch.
- **Performance Optimized:** Best SignalR is crafted for peak performance, assuring minimal latency and effective data exchanges for real-time engagements.
- **WebSocket Integration:** One of SignalR's paramount features is its adept use of [WebSockets](../WebSockets/index.md).
This communication protocol ensures full-duplex channels over a single TCP connection, promoting simultaneous data transmission without re-establishing connections.
This leads to rapid and efficient communication, pivotal for real-time applications.
If WebSockets aren't availabe due to specific constraints, SignalR seamlessly falls back to Long-Polling, keeping the protocol running.
- **Event-Driven Communication:** Harness event-based real-time communication, making your applications vibrant and user-centric.
- **Auto-Reconnection:** Best SignalR adeptly handles reconnections, guaranteeing continuous user experiences even amidst unstable network scenarios.
- **Secure Communications:** With encrypted connection support, Best SignalR ensures your application data remains confidential and shielded.
- **Profiler Integration:** Unlock the potential of the in-depth [Best HTTP profiler](../Shared/profiler/index.md) integration:
    - **Memory Profiler:** Evaluate internal memory usages, enhance performance, and spot potential memory challenges.
    - **Network Profiler:** Keep a tab on your network dynamics, studying data flow, connection statuses, and more.
- **Group and Hub Extensibility:** Classify your SignalR interactions effortlessly, curating distinct groups and hubs suited to your application's landscape.
- **Effective Data Models:** Best SignalR supports both JSON and binary data, granting you flexibility in data management.
- **Debugging and Logging:** Extensive logging capabilities empower developers to delve into the nuances of the package and simplify the debugging trajectory.

## Documentation Sections
Embark on your Best SignalR odyssey:

- [Installation Guide:](installation.md) Kickstart with Best SignalR, set up the package, and optimize your Unity environment.
- [Upgrade Guide:](upgrade-guide.md) Transitioning from a prior version? Get acquainted with the newest features and smooth out your upgrade steps.
- [Getting Started:](getting-started/index.md) Initiate your SignalR exploration, grasp the basics, and align Best SignalR to your application's essence.
- [Advanced Topics:](intermediate-topics/index.md) Plunge into deeper SignalR themes, encompassing event management, group strategies, and beyond.

This documentation is designed for developers of all backgrounds and expertise. 
Whether you're new to Unity or a seasoned professional, these guides will assist you in maximizing the capabilities of Best SignalR.

Dive in now and elevate your Unity projects with superior real-time communication features using Best SignalR!