import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practical_growth_route_network_cli/core/env/environment.dart';

import 'package:practical_growth_route_network_cli/core/error_handling/error.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/exception.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/http_client_response.dart';
import 'package:practical_growth_route_network_cli/data/models/product_model.dart';

/// Interface that defines the operations for fetching products.
abstract class ProductDataSource {
  /// Fetches a list of products.
  Future<List<ProductModel>> getProducts();
}

/// Implementation of [ProductDataSource] that uses an HTTP client to fetch products.
class ProductDataSourceImpl implements ProductDataSource {
  final http.Client client;

  /// Constructor that requires an HTTP client.
  ProductDataSourceImpl({
    required this.client,
  });

  /// Fetches a list of products from a remote API.
  ///
  /// Makes a GET request to the URL defined in the environment and decodes
  /// the JSON response into a list of [ProductModel].
  ///
  /// Throws [ClientFailure], [ErrorFailure], or [ExceptionFailure] in case of errors.
  @override
  Future<List<ProductModel>> getProducts() async {
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
  }
}