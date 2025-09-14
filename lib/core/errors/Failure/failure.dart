import 'package:dio/dio.dart';

class Failure {
  final String errorMessage;
  Failure({
    required this.errorMessage,
  });
}

class ServerFailure extends Failure {
  ServerFailure({
    required super.errorMessage,
  });

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          errorMessage: "Connection timeout with API server.",
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          errorMessage: "Send timeout with API server.",
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          errorMessage: "Receive timeout with API server.",
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          errorMessage:
              "Connection to API server failed due to an invalid certificate.",
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response);
      case DioExceptionType.cancel:
        return ServerFailure(
          errorMessage:
              "Connection to API was cancelled. Please try again later.",
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          errorMessage:
              "Connection to API server failed due to an internet connection issue.",
        );
      case DioExceptionType.unknown:
        return ServerFailure.fromResponse(dioError.response);
      default:
        return ServerFailure(
          errorMessage: "Something went wrong. Please try again later.",
        );
    }
  }

  factory ServerFailure.fromResponse(Response? response) {
    if (response == null) {
      return ServerFailure(errorMessage: "No response received from server.");
    }

    final statusMessage =
        response.data?["status_message"] ?? "Unexpected error occurred.";

    switch (response.statusCode) {
      case 400:
      case 401:
      case 403:
        return ServerFailure(
          errorMessage: statusMessage,
        );
      case 404:
        return ServerFailure(
          errorMessage: "Resource not found: $statusMessage",
        );
      case 500:
        return ServerFailure(
          errorMessage: "Server error. Please try again later.",
        );
      default:
        return ServerFailure(
          errorMessage:
              "Received unexpected status code: ${response.statusCode}",
        );
    }
  }
}
