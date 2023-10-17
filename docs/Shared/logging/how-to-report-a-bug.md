---
comments: true
---

# How to Report a Bug

## 📚 Documentation First

Before diving into the issue reporting process, please take a moment to read the documentation associated with the package or protocol you're using. 
Many common queries are often addressed in these documents.

## 🐛 Reporting Bugs

For a swift and effective resolution, we recommend the following steps when reporting a bug:

1. **Increase Logging Verbosity:** Execute the following line during the initialization phase of your application: 
    ```cs
    Best.HTTP.Shared.HTTPManager.Logger.Level = Best.HTTP.Shared.Logger.Loglevels.All;
    ```
    Further insights about logging can be located in the [logging topic](index.md).
2. **Gather Logs:** Collect logs from Unity's console or your log file, depending on your configuration while replicating your issue.
3. **Document Steps:** Write down the exact steps you took leading up to the issue.
4. **Submit a Report:** Share the logs and the steps to reproduce through one of the [support channels](../support.md), providing as much detail as possible.

Providing as much detail as possible will expedite the troubleshooting process.

## ✨ Feature Requests

If you have a suggestion or a feature you'd like to see in the protocol you use, let me know using one of the [support channels](../support.md). 
I value community feedback and look forward to hearing your ideas!

## 🤝 Contributing

If you've found a solution to a common problem or want to share some insights, feel free to contribute. Let's work together to make the Best protocols even better!

## 📣 Stay Updated

For the latest updates, features, and releases, make sure to:

- Join the plugin's [discord community](https://discord.gg/yD9tXwQ).
  
## 🚀 Support

If you're facing a critical issue or need direct support, consider reaching out at one of the [support channels](../support.md).