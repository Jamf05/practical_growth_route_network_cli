import 'package:http/http.dart' as http;

import 'package:practical_growth_route_network_cli/core/types/no_params.dart';
import 'package:practical_growth_route_network_cli/data/data_sources/product_data_source.dart';
import 'package:practical_growth_route_network_cli/data/models/product_model.dart';
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
      (r) => _printToConsole(r),
    );
  }

  static void _printToConsole(List<ProductModel> collection) {
    final buffer = StringBuffer('Get products use case console run success response: \n');
    buffer.writeln(" ");
    for (var element in collection) {
      buffer.writeln("id: ${element.id}");
      buffer.writeln("title: ${element.title}");
      buffer.writeln("price: ${element.price}");
      buffer.writeln("description: ${element.description}");
      buffer.writeln("category: ${element.category}");
      buffer.writeln("image: ${element.image}");
      buffer.writeln("rating [rate]: ${element.rating?.rate}");
      buffer.writeln("rating [count]: ${element.rating?.count}");
      buffer.writeln(" ");
    }
    print(buffer.toString());
  }
}
