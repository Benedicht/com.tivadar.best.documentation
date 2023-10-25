---
comments: true
---

# Installation Guide

!!! Warning "Dependency Alert"
    Before installing Best TLS Security, ensure you have the [Best HTTP package](../HTTP/index.md) installed and set up in your Unity project. If you haven't done so yet, refer to the [Best HTTP Installation Guide](../HTTP/installation.md).

Getting started with Best TLS Security requires a prior installation of the Best HTTP package. Once Best HTTP is set up, integrating Best TLS Security into your Unity project is a breeze.

## Installing from the Unity Asset Store using the Package Manager Window

1. **Purchase:** If you haven't previously purchased the package, proceed to do so. Once purchased, Unity will recognize your purchase, and you can install the package directly from within the Unity Editor. If you already own the package, you can skip these steps.
    1. **Visit the Unity Asset Store:** Navigate to the [Unity Asset Store](https://assetstore.unity.com/publishers/4137?aid=1101lfX8E) using your web browser.
    2. **Search for Best TLS Security:** Locate and choose the official Best TLS Security package.
    3. **Buy Best TLS Security:** By clicking on the `Buy Now` button go though the purchase process.
2. **Open Unity & Access the Package Manager:** Start Unity and select your project. Head to [Window > Package Manager](https://docs.unity3d.com/Manual/upm-ui.html).
3. **Select 'My Assets':** In the Package Manager, switch to the [My Assets](https://docs.unity3d.com/Manual/upm-ui-import.html) tab to view all accessible assets.
4. **Find Best TLS Security and Download:** Scroll to find "Best TLS Security". Click to view its details. If it isn't downloaded, you'll notice a Download button. Click and wait. After downloading, this button will change to Import.
5. **Import the Package:** Once downloaded, click the Import button. Unity will display all Best TLS Security' assets. Ensure all are selected and click Import.
6. **Confirmation:** After the import, Best TLS Security will integrate into your project, signaling a successful installation.

## Installing from a .unitypackage file

If you have a .unitypackage file for Best TLS Security, follow these steps:

1. **Download the .unitypackage:** Make sure the Best TLS Security.unitypackage file is saved on your device. 
2. **Import into Unity:** Open Unity and your project. Go to Assets > Import Package > Custom Package.
3. **Locate and Select the .unitypackage:** Find where you saved the Best TLS Security.unitypackage file, select it, and click Open.
4. **Review and Import:** Unity will show a list of all the package's assets. Ensure all assets are selected and click Import.
5. **Confirmation:** Post import, you'll see all the Best TLS Security assets in your project's Asset folder, indicating a successful setup.

!!! Note
    Best TLS Security also supports other installation techniques as documented in Unity's manual for packages. For more advanced installation methods, please see the Unity Manual on [Sharing Packages](https://docs.unity3d.com/Manual/cus-share.html).

## Assembly Definitions and Runtime References
For developers familiar with Unity's development patterns, it's essential to understand how Best TLS Security incorporates Unity's solutions:

- **Assembly Definition Files:** Best TLS Security incorporates [Unity's Assembly Definition files](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html). It aids in organizing and managing the codebase efficiently.
- **Auto-Referencing of Runtime DLLs:** The runtime DLLs produced by Best TLS Security are [Auto Referenced](https://docs.unity3d.com/Manual/class-AssemblyDefinitionImporter.html), allowing Unity to automatically recognize and utilize them without manual intervention.
- **Manual Package Referencing:** Should you need to reference Best TLS Security manually in your project (for advanced setups or specific use cases), you can do so. Simply [reference the package](https://docs.unity3d.com/Manual/ScriptCompilationAssemblyDefinitionFiles.html#reference-another-assembly) by searching for `com.Tivadar.Best.TLS Security`.

Congratulations! You've successfully integrated Best TLS Security into your Unity project. Begin your TLS Security adventure with the [Getting Started guide](getting-started/index.md).

For any issues or additional assistance, please consult the [Community and Support page](../Shared/support.md).