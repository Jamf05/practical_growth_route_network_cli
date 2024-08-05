import 'dart:developer';
import 'package:http/http.dart';

import 'package:practical_growth_route_network_cli/core/error_handling/failure.dart';

/// A class representing a failure caused by an exception.
/// Extends the [Failure] class.
class ExceptionFailure extends Failure {
  /// The exception that caused the failure.
  final Exception? exception;

  /// A message describing the failure.
  @override
  final String message;

  /// Private constructor for [ExceptionFailure].
  ExceptionFailure._({
    required this.message,
    this.exception,
  });

  /// Factory constructor to create an [ExceptionFailure] from an [Exception].
  /// Logs the exception and returns an instance of [ExceptionFailure].
  factory ExceptionFailure.decode(Exception? exception) {
    log(exception.toString(), name: 'FAILURE[EXCEPTION]');
    return ExceptionFailure._(
      exception: exception,
      message: exception.toString(),
    );
  }
  
  @override
  List<Object?> get props => [
    exception,
    message,
  ];
}

/// A class representing a failure caused by a client exception.
/// Extends the [Failure] class.
class ClientFailure extends Failure {
  /// The client exception that caused the failure.
  final ClientException? exception;

  /// A message describing the failure.
  @override
  final String message;

  /// Private constructor for [ClientFailure].
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
  
  @override
  List<Object?> get props => [
    exception,
    message,
  ];
}
