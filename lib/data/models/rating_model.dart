import 'package:practical_growth_route_network_cli/domain/entities/rating_entity.dart';

class RatingModel extends RatingEntity {
  RatingModel({
    double? rate,
    int? count,
  }) : super(
          rate: rate,
          count: count,
        );

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: double.tryParse((json["rate"]).toString()),
        count: int.tryParse((json["count"]).toString()),
      );
  
  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
