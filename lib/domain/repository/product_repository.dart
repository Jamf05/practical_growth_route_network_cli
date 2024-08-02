import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_cli/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}