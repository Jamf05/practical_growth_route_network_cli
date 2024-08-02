import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';
import 'package:practical_growth_route_network_cli/core/types/no_params.dart';
import 'package:practical_growth_route_network_cli/core/types/use_case.dart';
import 'package:practical_growth_route_network_cli/domain/entities/product_entity.dart';
import 'package:practical_growth_route_network_cli/domain/repository/product_repository.dart';

class GetProductsUseCase implements UseCase<List<ProductEntity>, NoParams> {
  final ProductRepository productRepository;

  GetProductsUseCase({
    required this.productRepository,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await productRepository.getProducts();
  }
}
