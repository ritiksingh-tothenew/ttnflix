import 'package:dio/dio.dart';

/// An enum that holds names for our custom exceptions.
enum ExceptionType {
  /// The exception for a prematurely cancelled request.
  CancelException,

  /// The exception for a failed connection attempt.
  ConnectTimeoutException,

  /// The exception for failing to send a request.
  SendTimeoutException,

  /// The exception for failing to receive a response.
  ReceiveTimeoutException,

  /// The exception for no internet connectivity.
  SocketException,

  /// A better name for the socket exception.
  FetchDataException,

  /// The exception for an incorrect parameter in a request/response.
  FormatException,

  /// The exception for an unknown type of failure.
  UnrecognizedException,

  /// The exception for an unknown exception from the api.
  ApiException,

  /// The exception for any parsing failure encountered during
  /// serialization/deserialization of a request.
  SerializationException,
  UnKnownException
}

class TTNFlixException implements Exception {
  final String name, message;
  final String? code;
  final int? statusCode;
  final ExceptionType exceptionType;

  TTNFlixException({
    this.code,
    int? statusCode,
    required this.message,
    this.exceptionType = ExceptionType.ApiException,
  })  : statusCode = statusCode ?? 500,
        name = exceptionType.name;

  factory TTNFlixException.fromDioException(Exception error) {
    try {
      if (error is DioException) {
        switch (error.type) {
          case DioExceptionType.cancel:
            return TTNFlixException(
              exceptionType: ExceptionType.CancelException,
              statusCode: error.response?.statusCode,
              message: 'Request cancelled prematurely',
            );
          case DioExceptionType.connectionTimeout:
            return TTNFlixException(
              exceptionType: ExceptionType.ConnectTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Connection not established',
            );
          case DioExceptionType.sendTimeout:
            return TTNFlixException(
              exceptionType: ExceptionType.SendTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Timeout Exception',
            );
          case DioExceptionType.receiveTimeout:
            return TTNFlixException(
              exceptionType: ExceptionType.ReceiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Timeout Exception',
            );
          case DioExceptionType.badCertificate:
            return TTNFlixException(
              exceptionType: ExceptionType.ReceiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Failed to receive response due to bad certificate',
            );
          case DioExceptionType.badResponse:
            return TTNFlixException(
              exceptionType: ExceptionType.ReceiveTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Bad response',
            );

          case DioExceptionType.connectionError:
            return TTNFlixException(
              exceptionType: ExceptionType.ConnectTimeoutException,
              statusCode: error.response?.statusCode,
              message: 'Connection Error',
            );

          case DioExceptionType.unknown:
            return TTNFlixException(
              exceptionType: ExceptionType.UnKnownException,
              statusCode: error.response?.statusCode,
              message: 'Failed to receive due to unknown error',
            );
        }
      } else {
        return TTNFlixException(
          exceptionType: ExceptionType.UnrecognizedException,
          message: 'Error unrecognized',
        );
      }
    } on FormatException catch (e) {
      return TTNFlixException(
        exceptionType: ExceptionType.FormatException,
        message: e.message,
      );
    } on Exception catch (_) {
      return TTNFlixException(
        exceptionType: ExceptionType.UnrecognizedException,
        message: 'Error unrecognized',
      );
    }
  }

  factory TTNFlixException.fromParsingException(Exception error) {
    return TTNFlixException(
      exceptionType: ExceptionType.SerializationException,
      message: 'Failed to parse network response to model or vice versa',
    );
  }
}
