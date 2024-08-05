import 'package:practical_growth_route_network_cli/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_cli/data/models/product_model.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_cli/domain/repository/product_repository.dart';

/// Implementation of the [ProductRepository] interface.
/// This class handles the data operations related to products.
class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;

  /// Constructor for [ProductRepositoryImpl].
  /// Requires a [ProductDataSource] to fetch product data.
  ProductRepositoryImpl({
    required this.productDataSource,
  });

  /// Fetches a list of products from the data source.
  /// 
  /// Returns a Future that resolves to either a [Failure] or a List of [ProductModel].
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      final products = await productDataSource.getProducts();
      return Right(products);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}