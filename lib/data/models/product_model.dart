import 'package:practical_growth_route_network_cli/core/extensions/mapping_extensions.dart';
import 'package:practical_growth_route_network_cli/data/models/rating_model.dart';
import 'package:practical_growth_route_network_cli/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    RatingModel? rating,
  }) : super(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          image: image,
          rating: rating,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: int.tryParse((json["id"]).toString()),
        title: json["title"],
        price: double.tryParse((json["price"]).toString()),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] != null && json["rating"] is Map
            ? null
            : RatingModel.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toModel().toJson(),
      };
}
