import 'package:equatable/equatable.dart';

/// A model class representing a rating.
/// This class extends [Equatable] to allow for value comparison.
class RatingModel extends Equatable {
  final double? rate;
  final int? count;

  /// Constructs a [RatingModel] instance.
  /// Both fields are optional and can be null.
  RatingModel({
    this.rate,
    this.count,
  });

  /// Creates a [RatingModel] instance from a Map object.
  ///
  /// The [json] parameter must be a map with keys corresponding to the fields
  /// of the [RatingModel] class.
  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: double.tryParse((json["rate"]).toString()),
        count: int.tryParse((json["count"]).toString()),
      );

  /// Converts the [RatingModel] instance to a Map object.
  ///
  /// Returns a map with keys corresponding to the fields of the [RatingModel] class.
  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };

  /// Overrides the [props] getter from [Equatable] to include all fields
  /// for value comparison.
  @override
  List<Object?> get props => [
        rate,
        count,
      ];
}
