import 'package:dartz/dartz.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCase2<Type, Param1, Param2> {
  Future<Either<Failure, Type>> call(Param1 param1, Param2 param2);
}

abstract class UseCase3<Type, Param1, Param2, Param3> {
  Future<Either<Failure, Type>> call(
      Param1 param1, Param2 param2, Param3 param3);
}

abstract class UseCase4<Type, Param1, Param2, Param3, Param4> {
  Future<Either<Failure, Type>> call(
      Param1 param1, Param2 param2, Param3 param3, Param4 param4);
}

abstract class UseCase5<Type, Param1, Param2, Param3, Param4, Param5> {
  Future<Either<Failure, Type>> call(Param1 param1, Param2 param2,
      Param3 param3, Param4 param4, Param5 param5);
}
