import 'package:equatable/equatable.dart';

/// Abstract class representing a failure.
/// This class extends Equatable to allow for value comparison.
abstract class Failure extends Equatable {
  /// A message describing the failure.
  String get message;
}
