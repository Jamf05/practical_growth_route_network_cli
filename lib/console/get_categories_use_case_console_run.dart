import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:practical_growth_route_network_cli/core/types/no_params.dart';
import 'package:practical_growth_route_network_cli/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_cli/data/repositories/product_repository_impl.dart';
import 'package:practical_growth_route_network_cli/domain/repository/product_repository.dart';
import 'package:practical_growth_route_network_cli/domain/use_case/get_categories_use_case.dart';

final class GetCategoriesUseCaseConsoleRun {
  static Future<void> call() async {
    final client = http.Client();
    final ProductDataSource productDataSource =
        ProductDataSourceImpl(client: client);
    final ProductRepository productRepository = ProductRepositoryImpl(
      productDataSource: productDataSource,
    );
    final getCategoriesUseCase = GetCategoriesUseCase(
      productRepository: productRepository,
    );
    final categories = await getCategoriesUseCase.call(NoParams());

    categories.fold(
      (l) => log('Error: $l'),
      (r) => _printToConsole(r),
    );
  }

  static void _printToConsole(List<String> collection) {
    final buffer = StringBuffer('Get categories use case console run success response: \n');
    for (var i = 0; i < collection.length; i++) {
      buffer.writeln("Category [$i]: ${collection[i]}");
    }
    log(buffer.toString());
  }
}