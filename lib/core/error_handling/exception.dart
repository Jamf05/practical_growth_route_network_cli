import 'dart:developer';

import 'package:http/http.dart';
import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';

class ExceptionFailure extends Failure {
  final Exception? exception;
  @override
  final String message;
  ExceptionFailure._({
    required this.message,
    this.exception,
  });
  factory ExceptionFailure.decode(Exception? exception) {
    log(exception.toString(), name: 'FAILURE[EXCEPTION]');
    return ExceptionFailure._(
      exception: exception,
      message: exception.toString(),
    );
  }
}

class ClientFailure extends Failure {
  final ClientException? exception;
  @override
  final String message;
  ClientFailure._({
    required this.message,
    this.exception,
  });
  factory ClientFailure.decode(ClientException? exception) {
    log(exception.toString(), name: 'FAILURE[CLIENTEXCEPTION]');
    return ClientFailure._(
      exception: exception,
      message: exception.toString(),
    );
  }
}
