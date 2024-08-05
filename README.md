# Practical growth route network cli

A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`.

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

  - `env`: This directory contains the `Environment` class which exposes constant key values ​​that can be used to query environment variables. Example:
  
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

## 📦 Models

### API data response

Response model returned by the endpoint:

```json
{
  "id": 1,
  "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
  "price": 109.95,
  "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
  "category": "men's clothing",
  "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
  "rating": {
    "rate": 3.9,
    "count": 120
  }
},
```

### Data modeling

`ProductModel`

- A model class representing a product.
- Its properties represent approximate types for the values ​​coming from the API response.
- `RatingModel` is a model class representing a rating.
- All model properties can be `null`, this provides flexibility in handling safe nullability in dart.

```dart
class ProductModel extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingModel? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: int.tryParse((json["id"]).toString()),
        title: json["title"],
        price: double.tryParse((json["price"]).toString()),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] != null && json["rating"] is Map
            ? RatingModel.fromJson(json["rating"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        rating,
      ];
}
```

`RatingModel`

- A model class representing a rating.
- Its properties represent approximate types for the values ​​coming from the API response.
- All model properties can be `null`, this provides flexibility in handling safe nullability in dart.

```dart
class RatingModel extends Equatable {
  final double? rate;
  final int? count;

  RatingModel({
    this.rate,
    this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: double.tryParse((json["rate"]).toString()),
        count: int.tryParse((json["count"]).toString()),
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };

  @override
  List<Object?> get props => [
        rate,
        count,
      ];
}
```

## ⚡ Http Request

The http package is imported and an HTTP client is created to make requests.

```dart
import 'package:http/http.dart' as http;
```

```dart
final http.Client client;
```

 A GET request is then made to a specified URL. The `api` constant key represents the API endpoint configuration and can be used to query environment variables.

```dart
final response = await client.get(Uri.parse('${String.fromEnvironment(Environment.api)}/products'));
```

## 🐞 Error handling

A try-catch block is used to handle different types of errors that may occur during the HTTP request and information modeling. `ClientException`, `Error`, and `Exception` are caught specifically and then transformed into possible implementations of the Failure class depending on the type of error.

Example:

| Error   | Exception          | Failure              |
|---------|--------------------|----------------------|
| `Error` | x                  | `ErrorFailure`       |
| x       | `Exception`        | `ExceptionFailure`   |
| x       | `ClientException`  | `ClientFailure`      |

```dart
try {
  // Do the request
} on http.ClientException catch (error) {
  throw ClientFailure.decode(error);
} on Error catch (error) {
  throw ErrorFailure.decode(error);
} on Exception catch (error) {
  throw ExceptionFailure.decode(error);
}
```

### HttpClientResponse

- A class that provides utility methods for handling HTTP client responses.
- Validates the given HTTP response.
- Throws a [ClientException] if the response status code is not in the range 200-299.
- Takes a [Response] as input and validates the response status code is not in the range 200-299

```dart
final class HttpClientResponse {
  static void validate(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw http.ClientException(
        'Status code: ${response.statusCode}',
        response.request?.url,
      );
    }
  }
}
```

### Complete code block

```dart
try {
  final response = await client.get(
      Uri.parse('${String.fromEnvironment(Environment.api)}/products'));
  HttpClientResponse.validate(response);
  final data = json.decode(response.body);
  if (data is List) {
    return data.map((e) => ProductModel.fromJson(e)).toList();
  } else {
    throw FormatException('Data is not a List');
  }
} on http.ClientException catch (error) {
  throw ClientFailure.decode(error);
} on Error catch (error) {
  throw ErrorFailure.decode(error);
} on Exception catch (error) {
  throw ExceptionFailure.decode(error);
}
```

### Failure flow in repository

Once the data source triggers the exception and it becomes a Failure, it will continue its flow to be captured by the repository and encapsulated within an `Either`.

```dart
try {
  final products = await productDataSource.getProducts();
  return Right(products);
} on Failure catch (e) {
  return Left(e);
}
```

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
