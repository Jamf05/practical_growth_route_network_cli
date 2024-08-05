import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_cli/core/types/no_params.dart';
import 'package:practical_growth_route_network_cli/core/types/use_case.dart';
import 'package:practical_growth_route_network_cli/domain/repository/product_repository.dart';

/// Use case for getting categories from the product repository.
class GetCategoriesUseCase implements UseCase<List<String>, NoParams> {
  final ProductRepository productRepository;

  /// Constructor for GetCategoriesUseCase.
  /// Requires a [ProductRepository] instance.
  GetCategoriesUseCase({
    required this.productRepository,
  });

  /// Calls the getCategories method from the product repository.
  /// Returns a [Future] that resolves to an [Either] containing
  /// a [Failure] or a list of category strings.
  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    return await productRepository.getCategories();
  }
}
