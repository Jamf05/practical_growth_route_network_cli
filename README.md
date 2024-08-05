# Practical growth route network cli

A simple Flutter application.

## 📝 Requirements

- Any Operating System (ie. MacOS X, Linux, Windows)
- Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio, VSCode etc)
- A little knowledge of Dart and Flutter
- Version summary:

    ```plain
    Dart SDK version: 3.4.4 (stable) (Wed Jun 12 15:54:31 2024 +0000) on "macos_arm64"
    ```

## 📁 Project Structure

This project follows the guidelines of clean architecture.

```text
.
├── analysis_options.yaml
├── bin
│   └── practical_growth_route_network_cli.dart
├── CHANGELOG.md
├── lib
│   ├── console
│   │   ├── get_categories_use_case_console_run.dart
│   │   ├── get_products_by_category_use_case_console_run.dart
│   │   └── get_products_use_case_console_run.dart
│   ├── core
│   │   ├── env
│   │   │   └── environment.dart
│   │   ├── error_handling
│   │   │   ├── error.dart
│   │   │   ├── exception.dart
│   │   │   ├── failure.dart
│   │   │   └── http_client_response.dart
│   │   └── types
│   │       ├── no_params.dart
│   │       └── use_case.dart
│   ├── data
│   │   ├── data_sources
│   │   │   └── product_data_source.dart
│   │   ├── models
│   │   │   ├── product_model.dart
│   │   │   └── rating_model.dart
│   │   └── repositories
│   │       └── product_repository_impl.dart
│   ├── domain
│   │   ├── repository
│   │   │   └── product_repository.dart
│   │   └── use_case
│   │       ├── get_categories_use_case.dart
│   │       ├── get_products_by_category_use_case.dart
│   │       └── get_products_use_case.dart
│   └── practical_growth_route_network_cli.dart
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

- `console`: This folder contains the entry point of the application, including configurations and initializations needed to run the application from the command line.

- `core`: This folder includes fundamental and shared resources used throughout the project. It is subdivided into:

  - `env`: This directory contains the environment class which exposes constant key values ​​that can be used to query environment variables. Example:
  
    ```dart
    final api = String.fromEnvironment(Environment.api);
    ```

  - `error_handling`: This folder contains classes and utilities for managing errors and exceptions in a standardized way across the application.

  - `types`: This directory includes type definitions that are used across multiple layers of the application to ensure type safety and consistency.

- `data`: This folder is responsible for handling data-related operations, such as fetching data from APIs or databases. It is organized into:

  - `data_sources`: This directory contains classes that define the sources of data, such as APIs.

  - `models`: This folder holds data models which represent the structure of data that the application handles and manipulates.

  - `repositories`: This directory includes implementation of repositories that interact with data sources and provide a unified data access layer for the application.

- `domain`: This folder represents the business logic layer of the application. It contains business rules and is structured into:

  - `repository`: This directory holds abstract repository definitions that declare the contracts for data operations without specifying the implementation details.

  - `use_case`: This folder contains use case classes, which encapsulate specific business logic and coordinate actions between different models and repositories.

## 🔌 Packages

| Name                                                                              | Usage                                               |
| --------------------------------------------------------------------------------- | --------------------------------------------------- |
| [**Dartz**](https://pub.dev/packages/dartz)                                       | Functional Error Handling                           |
| [**Equatable**](https://pub.dev/packages/equatable)                               | A Dart package that helps to implement value based equality without needing to explicitly override == and hashCode. |
| [**Http**](https://pub.dev/packages/http)                                         | A composable, multi-platform, Future-based API for HTTP requests. |

## 🚀 Environment Variables

- `API`: Its value is `https://fakestoreapi.com`.

## 🚀 Getting Started

```bash
dart run --define=API=https://fakestoreapi.com
````

## 👨‍💻 Author(s)

[**Jorge A. Mogotocoro F.**](https://www.linkedin.com/in/jorgemogotocoro/)
