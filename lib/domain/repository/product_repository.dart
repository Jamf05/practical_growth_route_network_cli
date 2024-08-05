import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_cli/data/models/product_model.dart';

/// Abstract class representing a repository for managing products.
abstract class ProductRepository {
  /// Fetches a list of products.
  ///
  /// Returns a [Future] that completes with an [Either] containing a [Failure] 
  /// on the left side if an error occurs, or a [List] of [ProductModel] on the right side if successful.
  Future<Either<Failure, List<ProductModel>>> getProducts();
}