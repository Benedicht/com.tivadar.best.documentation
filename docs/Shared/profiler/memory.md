---
comments: true
---

# Memory Profiler
The Best HTTP Memory Profiler is an integrated tool provided within the Best HTTP package, designed specifically for use with Unity Profiler. 
Its purpose extends beyond the confines of just the HTTP component – all protocols and packages that are part of or built upon the Best HTTP framework stand to gain from its features. 
This integration allows for holistic memory management and optimization across all these components.

## How to Show the Module in Unity Profiler
1. **Access the Unity Profiler:** Open Unity and navigate to *Window > Analysis > Profiler* to open the [Profiler window](https://docs.unity3d.com/Manual/ProfilerWindow.html).
2. **Add the 'Best - Memory' Profiler Module:** Within the Profiler window, click on the **'Profiler Modules :octicons-triangle-down-24:'** button. 
This will reveal a list of available modules.
3. **Select the 'Best - Memory' Module:** From the dropdown list, locate and select "Best - Memory". 
This action will add a new tab to your Profiler window, dedicated to the *Best HTTP Memory Profiler Module*.
4. **View Real-Time Metrics:** Once enabled, the metrics from the Best HTTP Memory Profiler will be displayed alongside other system and application metrics, giving you a comprehensive view of your application's performance.

![Memory Profiler in Action](/assets/images/profiler/memory-light.png#only-light){ loading=lazy }
![Memory Profiler in Action](/assets/images/profiler/memory-dark.png#only-dark){ loading=lazy }

## Key Metrics Explained
In the realm of efficient memory management, being able to gauge and interpret specific metrics is crucial. The Best HTTP Memory Profiler offers several key indicators:

- **Borrowed:** This metric displays the amount of memory currently in use that has been borrowed from the `BufferPool`.
For instance, if it reads `"392.0 KB"`, it means protocols/packages are actively using *392.0 KB* of memory from the pool.
- **Pooled:** This indicates the memory currently held within the `BufferPool` but not actively in use.
For example, a value of `"456.2 KB"` denotes that there's *456.2 KB* of memory pre-allocated and waiting to be used, ensuring quick response times for future requests that need byte arrays.
- **Cache Hits:** A cache hit occurs when a request for memory can be satisfied using a byte array from the `BufferPool`, rather than allocating new memory. 
A higher number of cache hits is generally a positive sign, indicating efficient memory reuse. In the given example, `"3.03k"` cache hits imply that memory reuse occurred *3.03k* times, which potentially means 623 instances where allocation (and eventual deallocation) overheads were avoided.
- **Array Allocations (Cache Misses):** Conversely, cache misses are instances when the `BufferPool` couldn't satisfy a memory request, leading to the allocation of a new byte array. The lower this number, the better. 
In the example, `"18"` cache misses means there were 18 instances when the buffer pool didn't have a suitable byte array available, prompting new memory allocation.

By understanding and regularly monitoring these metrics, developers can better grasp how memory is being utilized within their application, ensuring they're making the most of the `BufferPool` and the associated memory management tools. It helps in making informed decisions when optimizing, troubleshooting, and fine-tuning performance.

## Cross-Package Benefits

One of the standout features of integrating the Best HTTP Memory Profiler with Unity's Profiler is its ability to collect metrics outside the editor.
When the Unity project is built with the development build option turned on, you can gather performance data in real-world environments, 
making it invaluable for testing and optimizing applications in diverse scenarios.

### `BufferPool`
The `BufferPool` is a foundational element of the Best HTTP package, aiming to reduce dynamic memory allocation overheads by reusing byte arrays. 
The concept is elegantly simple: rather than allocating and deallocating memory for every requirement, byte arrays can be "borrowed" and "returned" within this pool.
Once returned, these arrays are retained for subsequent use, minimizing repetitive memory operations.

While the `BufferPool` is housed within the Best HTTP package, its benefits are not limited to just HTTP operations. 
All protocols and packages integrated with or built upon the Best HTTP package utilize and benefit from the `BufferPool`. 
This ensures that memory is used efficiently and performance remains optimal across all integrated components.

### Memory Profiler
The Memory Profiler offers granular insights into memory consumption and behavior across all integrated protocols and packages. By offering a unified view, it assists developers in:

- **Identifying Inefficiencies:** Recognize patterns of wasteful memory usage that might be prevalent across multiple components.
- **Optimizing Performance:** By pinpointing areas of high allocation and deallocation, developers can streamline their applications to minimize these costly operations.
- **Troubleshooting & Debugging:** Diagnose memory-related issues even in complex scenarios where multiple protocols/packages interact.

Just like the `BufferPool`, all protocols and packages that are part of or built upon the Best HTTP framework can utilize and benefit from the insights offered by the Memory Profiler.