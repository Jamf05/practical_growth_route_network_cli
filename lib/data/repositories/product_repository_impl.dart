import 'package:practical_growth_route_network_cli/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_cli/domain/entities/product_entity.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_cli/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl({
    required this.productDataSource,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final products = await productDataSource.getProducts();
      return Right(products);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
