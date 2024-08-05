import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_cli/core/types/use_case.dart';
import 'package:practical_growth_route_network_cli/data/models/product_model.dart';
import 'package:practical_growth_route_network_cli/domain/repository/product_repository.dart';

/// Use case for retrieving products by category.
/// Implements the [UseCase] interface with a list of [ProductModel] as the output and a [String] as the input.
class GetProductsByCategoryUseCase
    implements UseCase<List<ProductModel>, String> {
  /// Repository to fetch products from.
  final ProductRepository productRepository;

  /// Constructor for [GetProductsByCategoryUseCase].
  /// Requires a [ProductRepository] to be provided.
  GetProductsByCategoryUseCase({
    required this.productRepository,
  });

  /// Calls the use case to get products by category.
  /// Takes a [String] parameter representing the category.
  /// Returns a [Future] with an [Either] containing a [Failure] or a list of [ProductModel].
  @override
  Future<Either<Failure, List<ProductModel>>> call(String category) {
    return productRepository.getProductsByCategory(category: category);
  }
}
