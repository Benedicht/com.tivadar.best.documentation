---
comments: true
---

This guide is designed to help users seamlessly transition from **Best HTTP/2** to the new major release (v3.x).
If you're updating your package, please read through the relevant sections to ensure a smooth upgrade.

## Pre-upgrade Checklist
- [x] **Backup Your Project:** Always create a backup of your entire project before starting the upgrade process. This allows you to revert changes if something goes awry.
- [x] **Review Deprecated Features:** Check if you're using any features or methods that were marked as deprecated in the last release. Transition away from these first.

## Post-upgrade Steps
- [x] **Update API Calls:** If the new version introduced new methods or altered existing ones, update your calls accordingly.
- [x] **Test Extensively:** After upgrading, test all functionalities in your project that utilize the Best HTTP package to ensure they work as expected.

## ^^List of Breaking Changes^^

### Namespace changes
Instead of one big package the new version is split into multiple packages. This packaging change is reflected in how the plugins' namespaces are named. 
For the Best HTTP package this means that its root namespace is `Best.HTTP` instead of `BestHTTP`.
Upgrading old code might need only an additional dot ('.') in the middle. 
For a better upgrade experience I kept the most used `HTTPRequest` and `HTTPResponse` classes in the root namespace.

However, other classes are now under different namespaces. Here I'll list a few common classes, their old and new namespaces:

| Class | Old Namespace { title="Namespace of the class in Best HTTP/2" } | New Namespace { title="Namespace of the class in Best HTTP v3" } |
|------------|---------------|---------------|
| `HTTPManager` | `BestHTTP` | `Best.HTTP.Shared` |
| `HTTPProxy` | `BestHTTP` | `Best.HTTP.Proxies` |
| `LogLevels` | `BestHTTP.Logger` | `Best.HTTP.Shared.Logger` |

Depending on what IDE you use, deleting old usings it can help finding new ones.

### HTTPRequest changes

1. Removed/changed constructors
2. New static functions for HTTPRequest creation
3. Moved fields under settings classes

Solution: Guide or recommendations to tackle this change.

### HTTPResponse changes
Description of the breaking change.

Solution: Guide or recommendations to tackle this change.

### HTTPManager changes
Description of the breaking change.

Solution: Guide or recommendations to tackle this change.

### Caching changes
Description of the breaking change.

Solution: Guide or recommendations to tackle this change.

### Cookie changes
Description of the breaking change.

Solution: Guide or recommendations to tackle this change.

### Authentication changes
Description of the breaking change.

Solution: Guide or recommendations to tackle this change.

## General Tips
1. **Stay Updated on Documentation:** Keep an eye on the official documentation for the Best HTTP package. It's regularly updated with new information, tutorials, and solutions to common problems.
2. **Engage with the Community:** Join discussions on our [Community and Support page](support.md) to share your experiences, ask questions, and get advice on the upgrade process.
3. **Check for Updates Regularly:** Ensure you always have the latest features, improvements, and bug fixes by regularly checking for updates.


*[IDE]: Integrated Development Environment