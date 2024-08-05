import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';

/// Abstract class representing a use case in the application.
/// 
/// A use case is a specific business logic operation that the application can perform.
/// It takes parameters of type [Params] and returns a [Future] that resolves to an [Either]
/// containing a [Failure] or a result of type [Type].
abstract class UseCase<Type, Params> {
  /// Executes the use case with the given parameters.
  /// 
  /// [params] - The parameters required to execute the use case.
  /// 
  /// Returns a [Future] that resolves to an [Either] containing a [Failure] or a result of type [Type].
  Future<Either<Failure, Type>> call(Params params);
}