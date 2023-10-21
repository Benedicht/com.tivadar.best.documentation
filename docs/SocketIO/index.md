# Best SocketIO

Welcome to the Best SocketIO Documentation! Best SocketIO is a leading Unity networking library engineered for a smooth integration of the Socket.IO technology. 
Ideal for dynamic real-time experiences like online multiplayer games, chat systems, and interactive dashboards.

!!! Warning "**Dependency Alert**"
    Best SocketIO depends on both the **Best HTTP** and **Best WebSockets** packages! 
    Ensure you've installed and configured both these packages in your Unity project before venturing into Best SocketIO. 
    Explore more about the [installation of Best HTTP](../HTTP/installation.md) and [Best WebSockets](../WebSockets/installation.md).

## Overview
In today's interconnected world, maintaining real-time interactions is pivotal for a vast array of applications. 
From multiplayer game lobbies to instant chat rooms, Socket.IO empowers these interactions with speed and efficiency. 
Best SocketIO makes it a breeze to incorporate this tech into your Unity endeavours, ensuring dynamic bi-directional exchanges.

## Key Features
- **Supported Unity Versions:** Best SocketIO is compatible with Unity versions starting from :fontawesome-brands-unity: **2021.1 onwards**.
- **Compatibility with Socket.io:** Best SocketIO is fully compatible with the latest version of socket.io, ensuring you're equipped with cutting-edge real-time communication capabilities.
- **Cross-Platform Excellence:** Best SocketIO is designed for a broad range of Unity-supported platforms, making it versatile for an array of projects. It proudly supports:
    
    - :fontawesome-solid-desktop: **Desktop:** Windows, Linux, MacOS
    - :fontawesome-solid-mobile:  **Mobile:** iOS, Android
    - :material-microsoft-windows: **Universal Windows Platform (UWP)**
    - :material-web: **Web Browsers:** WebGL
    
    With such extensive platform support, Best SocketIO stands out as the go-to choice irrespective of your targeted platform or audience segment.

- **Seamless Integration:** With intuitive APIs and extensive documentation, integrating Best SocketIO into any Unity project is a straightforward process.
- **Performance Optimized:** Best SocketIO is engineered for high performance, ensuring minimal latency and efficient data transfers for real-time interactions.
- **Event-Driven Communication:** Embrace the power of event-based real-time communication, making your applications responsive and lively.
- **Auto-Reconnection:** Best SocketIO automatically manages reconnections, ensuring uninterrupted user experiences even in fluctuating network conditions.
- **Secure Layers:** Supporting encrypted connections, Best SocketIO ensures that your application's exchanges are secure and protected.
- **Profiler Integration:** Benefit from the in-depth [Best HTTP profiler](../Shared/profiler/index.md) integration:
    - **Memory Profiler:** Assess the internal memory allocations, optimizing performance and detecting potential memory issues.
    - **Network Profiler:** Monitor your networking intricacies, observing data exchanges, connection states, and more.
- **Extensible Rooms and Namespaces:** Organize your SocketIO communications with ease, creating distinct rooms[^1] and namespaces tailored to your app's needs.
- **Efficient Data Formats:** With support for both JSON and binary data, manage your data formats effectively.
- **Debugging and Logging:** Comprehensive logging options enable developers to get insights into the workings of the package and simplify the debugging process.

## Documentation Sections
Embark on your journey with Best SocketIO:

- [Installation Guide:](installation.md) Begin with Best SocketIO by integrating the package and setting up your Unity ecosystem.
- [Upgrade Guide:](upgrade-guide.md) Upgrading from an older variant? Get insights into the latest enhancements and streamline your upgrade process.
- [Getting Started:](getting-started/index.md) Start your SocketIO adventure, learn the rudiments, and tailor Best SocketIO to your app's requirements.
- [Advanced Insights:](intermediate-topics/index.md) Dive deeper with advanced SocketIO subjects, including event handling, rooms management, and more.

This comprehensive documentation caters to developers from various walks of life. 
Whether you're a Unity novice or a seasoned expert, these guides will bolster your journey, leveraging Best SocketIO's prowess.

Delve deep and supercharge your Unity creations with unmatched real-time interactions, all thanks to Best SocketIO!

[^1]: [Rooms](https://socket.io/docs/v4/rooms/) are completely server-side features, no client support required!