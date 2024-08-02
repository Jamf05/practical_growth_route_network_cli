import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:practical_growth_route_network_cli/core/error_handling/error.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/exception.dart';
import 'package:practical_growth_route_network_cli/data/models/product_model.dart';


abstract class ProductDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductDataSourceImpl implements ProductDataSource {
  final http.Client client;

  ProductDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response =
          await client.get(Uri.parse('https://fakestoreapi.com/products'));
      final data = json.decode(response.body);

      if (data is List) {
        return data.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        throw Exception('Data is not a List');
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
