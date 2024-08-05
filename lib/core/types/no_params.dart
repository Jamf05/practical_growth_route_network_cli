import 'package:equatable/equatable.dart';

/// A class that represents an object with no parameters.
/// 
/// This class extends [Equatable] to allow for value comparison.
class NoParams extends Equatable {
  /// Returns an empty list of properties.
  /// 
  /// This is used by Equatable to determine if two instances are equal.
  @override
  List<Object> get props => <Object>[];
}
