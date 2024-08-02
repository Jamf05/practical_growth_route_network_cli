import 'package:http/http.dart' as http;
import 'package:practical_growth_route_network_cli/core/extensions/mapping_extensions.dart';

import 'package:practical_growth_route_network_cli/core/types/no_params.dart';
import 'package:practical_growth_route_network_cli/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_cli/data/repositories/product_repository_impl.dart';
import 'package:practical_growth_route_network_cli/domain/repository/product_repository.dart';
import 'package:practical_growth_route_network_cli/domain/use_case/get_products_use_case.dart';

final class GetProductsUseCaseConsoleRun {
  static Future<void> call() async {
    final client = http.Client();
    final ProductDataSource productDataSource =
        ProductDataSourceImpl(client: client);
    final ProductRepository productRepository = ProductRepositoryImpl(
      productDataSource: productDataSource,
    );
    final getProductsUseCase = GetProductsUseCase(
      productRepository: productRepository,
    );
    final products = await getProductsUseCase.call(NoParams());

    products.fold(
      (l) => print('Error: $l'),
      (r) => print('Products: ${r.map((e) => e.toModel().toJson())}'),
    );
  }
}
