import 'package:practical_growth_route_network_cli/data/models/product_model.dart';
import 'package:practical_growth_route_network_cli/data/models/rating_model.dart';
import 'package:practical_growth_route_network_cli/domain/entities/product_entity.dart';
import 'package:practical_growth_route_network_cli/domain/entities/rating_entity.dart';

extension ProductMappingExtensions on ProductEntity {
  ProductModel toModel() {
    return ProductModel(
      id: id,
      title: title,
      price: price,
      description: description,
      category: category,
      image: image,
      rating: rating?.toModel(),
    );
  }
}

extension MappingExtensions on RatingEntity {
  RatingModel toModel() {
    return RatingModel(
      rate: rate,
      count: count,
    );
  }
}
