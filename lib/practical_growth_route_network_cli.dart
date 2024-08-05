import 'package:practical_growth_route_network_cli/console/get_categories_use_case_console_run.dart';
import 'package:practical_growth_route_network_cli/console/get_products_by_category_use_case_console_run.dart';
import 'package:practical_growth_route_network_cli/console/get_products_use_case_console_run.dart';

void call() async {
  print('Hello, Practical Growth Route Network CLI!');
  await GetProductsUseCaseConsoleRun.call();
  await GetCategoriesUseCaseConsoleRun.call();
  await GetProductsByCategoryUseCaseConsoleRun.call();
}
