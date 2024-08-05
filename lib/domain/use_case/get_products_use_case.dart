import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_cli/core/types/no_params.dart';
import 'package:practical_growth_route_network_cli/core/types/use_case.dart';
import 'package:practical_growth_route_network_cli/data/models/product_model.dart';
import 'package:practical_growth_route_network_cli/domain/repository/product_repository.dart';

/// Use case for fetching a list of products.
class GetProductsUseCase implements UseCase<List<ProductModel>, NoParams> {
  final ProductRepository productRepository;

  /// Constructor for [GetProductsUseCase].
  ///
  /// Takes a [ProductRepository] as a required parameter.
  GetProductsUseCase({
    required this.productRepository,
  });

  /// Calls the use case to fetch products.
  ///
  /// Takes [NoParams] as input and returns a [Future] that completes with an [Either]
  /// containing a [Failure] on the left side if an error occurs, or a [List] of [ProductModel]
  /// on the right side if successful.
  @override
  Future<Either<Failure, List<ProductModel>>> call(NoParams params) async {
    return await productRepository.getProducts();
  }
}