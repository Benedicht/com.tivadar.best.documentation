# Best Documentation Source

This repository is the source for the documentation of the Best-suite, which includes the Best HTTP, Best TLS Security, Best WebSockets, Best MQTT, Best Socket.IO, and Best SignalR packages, available on the Unity Asset Store.

## Documentation Links

These are the documentations compiled from this repository:

- [Best HTTP Documentation](https://bestdocshub.pages.dev/HTTP/)
- [Best TLS Security Documentation](https://bestdocshub.pages.dev/TLS%20Security/)
- [Best WebSockets Documentation](https://bestdocshub.pages.dev/WebSockets/)
- [Best MQTT Documentation](https://bestdocshub.pages.dev/MQTT/)
- [Best Socket.IO Documentation](https://bestdocshub.pages.dev/Socket.IO/)
- [Best SignalR Documentation](https://bestdocshub.pages.dev/SignalR/)

## Repository Structure

- `/docs`: Markdown files for documentation content of all packages, each package has its own directory.
- `/mkdocs.yml`: MkDocs and mkdocs-material configuration file.
- `/requirements.txt`: Python dependencies for mkdocs-material plugins.
- `/docs/assets/stylesheets`: Custom css files additionally to the supplied one from mkdocs-material.

## Building Documentation Locally

Preview the site with Podman, without installing Python packages on the machine:

```bash
./serve.sh
```

Then open [http://127.0.0.1:8000/](http://127.0.0.1:8000/). Edits under `docs/` are rebuilt while the server is running. Stop it with Ctrl+C.

`PORT` changes the host port (`PORT=8001 ./serve.sh`). `MKDOCS_IMAGE` overrides the container image.

## Reporting Issues

For issues with the documentation, please use the [Issues](https://github.com/Benedicht/com.tivadar.best.documentation/issues) section of this repository.

## License

The documentation is under [MIT License](LICENSE).

## Contact

For support or inquiries regarding the Best HTTP Suite, please refer to our [Support Page](https://bestdocshub.pages.dev/Shared/support/) to choose the most suitable contact method for your needs.

## Acknowledgements

Thanks to all contributors for helping maintain and improve this documentation.
