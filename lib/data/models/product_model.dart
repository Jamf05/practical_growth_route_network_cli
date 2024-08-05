import 'package:equatable/equatable.dart';
import 'package:practical_growth_route_network_cli/data/models/rating_model.dart';

/// A model class representing a product.
/// This class extends [Equatable] to allow for value comparison.
class ProductModel extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingModel? rating;

  /// Constructs a [ProductModel] instance.
  /// All fields are optional and can be null.
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  /// Creates a [ProductModel] instance from a Map object.
  /// 
  /// The [json] parameter must be a map with keys corresponding to the fields
  /// of the [ProductModel] class.
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: int.tryParse((json["id"]).toString()),
        title: json["title"],
        price: double.tryParse((json["price"]).toString()),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: json["rating"] != null && json["rating"] is Map
            ? RatingModel.fromJson(json["rating"])
            : null,
      );

  /// Converts the [ProductModel] instance to a Map object.
  /// 
  /// Returns a map with keys corresponding to the fields of the [ProductModel] class.
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };

  /// Overrides the [props] getter from [Equatable] to include all fields
  /// for value comparison.
  @override
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        rating,
      ];
}