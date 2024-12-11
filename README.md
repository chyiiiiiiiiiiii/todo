# Serverpod Examples

- [serverpod](serverpod/README.md): A full-featured backend framework designed for building scalable applications with type-safe APIs.
- [serverpod-mini](serverpod-mini/README.md): A simplified version of the Serverpod framework, ideal for learning core concepts and functionalities in a minimalistic setup.
- [serverpod-mini-stream-messaging](serverpod-mini-stream-messaging/README.md): A project showcasing real-time messaging capabilities using Serverpod, demonstrating efficient task management with a Flutter frontend.

## Auto hot reload for running serverpod server

1. Install nodemon
**nodemon** is the application that does the monitoring and executing.
```bash
npm install -g nodemon
```

2. Run and monitor the main entry of serverpod server
```bash
nodemon -x "dart run bin/main.dart --apply-migrations" -e dart
```

- `-x` to execute "dart run bin/main.dart --apply-migrations".
- `-e dart` monitor .dart files for changes. If it detects a change, it kills the current process and starts a new one.

## Documentation

Comprehensive documentation is available at [serverpod.dev](https://docs.serverpod.dev/).

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.
