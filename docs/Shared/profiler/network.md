---
comments: true
---

# Network Profiler

The Best HTTP Network Profiler is an integrated tool provided within the Best HTTP package, designed specifically for use with Unity Profiler. Just like its memory counterpart, all protocols and packages that are part of or built upon the Best HTTP framework stand to gain from its features. This integration allows for thorough network management and optimization across all these components.

## How to Show the Module in Unity Profiler

1. **Access the Unity Profiler:** Open Unity and navigate to *Window > Analysis > Profiler* to open the [Profiler window](https://docs.unity3d.com/Manual/ProfilerWindow.html).
2. **Add the 'Best - Network' Profiler Module:** Within the Profiler window, click on the **'Profiler Modules :octicons-triangle-down-24:'** button. This will reveal a list of available modules.
3. **Select the 'Best - Network' Module:** From the dropdown list, locate and select "Best - Network". This action will add a new tab to your Profiler window, dedicated to the *Best HTTP Network Profiler Module*.
4. **View Real-Time Metrics:** Once enabled, the metrics from the Best HTTP Network Profiler will be displayed alongside other system and application metrics, giving you a comprehensive view of your application's network performance.

![Network Profiler in Action](media/network-light.png#only-light){ loading=lazy }
![Network Profiler in Action](media/network-dark.png#only-dark){ loading=lazy }

## Key Metrics Explained

To ensure the most efficient network operations, understanding and interpreting specific metrics is essential. The Best HTTP Network Profiler offers several key indicators:

- **Buffered to Send:** Shows the amount of data that is buffered and ready for transmission. For instance, if it reads `"0 B"`, it means there's currently no data buffered for sending.

- **Sent (Since Last Frame):** The amount of data that has been sent since the last frame was rendered in Unity. In the provided example, `"0 B"` indicates that no data has been sent since the last frame.

- **Sent Total:** Cumulative data volume sent since the application started. If it displays `"6.8 KB"`, this denotes that the application has transmitted a total of 6.8 KB of data since it began running.

- **Received and Unprocessed:** Indicates the volume of data received but yet to be processed. An example reading of `"0 B"` means all received data has been processed, and there's no backlog.

- **Received (Since Last Frame):** Data volume received since the last frame. A reading of `"0 B"` indicates no data has been received since the last frame.

- **Received Total:** Total amount of data received since the app began its operations. If the metric shows `"68.0 KB"`, this suggests the application has received a cumulative 68.0 KB of data since startup.

- **Open Connections:** Current number of active network connections. For example, if it reads `"2"`, this signifies there are currently 2 active network connections.

- **Total Connections:** Total count of connections made during the entire application's runtime. A value of `"22"` denotes that 22 connections have been established since the application started.

- **DNS Cache Hits:** Occurrences where the DNS request is satisfied using the [cache](../DNS/dns-cache.md), avoiding the need for a fresh DNS lookup. An example reading of `"0"` signifies that no DNS requests were served from the cache.

- **DNS Cache Miss:** Instances where the [DNS cache](../DNS/dns-cache.md) couldn't provide the required data, leading to a full DNS lookup. If this reads `"30"`, it indicates there were 30 occasions when a cached DNS entry wasn't available, prompting a complete DNS resolution.

By continually monitoring these metrics, developers can gain a deeper understanding of their application's network operations, making it easier to optimize, troubleshoot, and enhance performance.

## Cross-Package Benefits

One of the standout features of integrating the Best HTTP Network Profiler with Unity's Profiler is its capability to collect metrics outside the editor. When the Unity project is built with the development build option turned on, you can gather performance data in real-world environments, making it indispensable for testing and refining applications in various scenarios.

### Profiling in Action

The Network Profiler delivers in-depth insights into network operations across all integrated protocols and packages. By offering a unified view, it assists developers in:

- **Identifying Bottlenecks:** Recognize areas where data transmission might be lagging or inefficient.
  
- **Optimizing Data Flow:** By understanding data flow patterns, developers can streamline both the sending and receiving processes.
  
- **Troubleshooting & Debugging:** Diagnose network-related challenges even in scenarios where multiple protocols/packages interact.

Similar to the Memory Profiler, all protocols and packages that are part of or built upon the Best HTTP framework benefit from the insights provided by the Network Profiler.
