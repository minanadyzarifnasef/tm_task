// api_error_handler.dart
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'api_constants.dart';
import 'api_error_model.dart';

/// Enum representing different types of data source errors
enum DataSource {
  success,
  created,
  unauthorized,
  incorrectInput,
  serverError,
  noInternet,
  timeout,
  cancel,
  unknown,
}

/// Class containing HTTP response status codes
class ResponseCode {
  const ResponseCode._();

  // Success codes
  static const int success = 200;
  static const int created = 201;

  // Client error codes
  static const int unauthorized = 401;
  static const int incorrectInput = 422;

  // Server error codes
  static const int internalServerError = 500;

  // Local error codes
  static const int noInternet = -1;
  static const int timeout = -2;
  static const int cancel = -3;
  static const int unknown = -4;
}

/// Class containing response messages for different error types
class ResponseMessage {
  const ResponseMessage._();

  // Success messages
  static const String success = "Request successful";
  static const String created = "Resource created successfully";

  // Error messages
  static const String unauthorized = ApiErrors.unauthorizedError;
  static  String incorrectInput = ApiErrors.incorrectInputError;
  static const String internalServerError = ApiErrors.serverError;
  static const String noInternet = "No internet connection. Please check your network.";
  static const String timeout = "Request timeout. Please try again.";
  static const String cancel = "Request was cancelled.";
  static const String unknown = ApiErrors.othersError;
}

/// Extension on DataSource enum to get corresponding ApiErrorModel
extension DataSourceExtension on DataSource {
  ApiErrorModel getResponse({ DioException? error}) {

    switch (this) {
      case DataSource.success:
        return ApiErrorModel(
          code: ResponseCode.success,
          message:error?.response?.data['message']?? ResponseMessage.success,
          isSuccess: true,
        );
      case DataSource.created:
        return ApiErrorModel(
          code: ResponseCode.created,
          message:error?.response?.data['message']?? ResponseMessage.created,
          isSuccess: true,
        );
      case DataSource.unauthorized:

        return ApiErrorModel(
          code: ResponseCode.unauthorized,
          message:error?.response?.data['message']?? ResponseMessage.unauthorized,
          isSuccess: false,
          // details:(error?.response?.data['errors'] as List<dynamic>)
          //     .map((e) => e as Map<String, dynamic>)
          //     .toList(),
        );
      case DataSource.incorrectInput:

        return ApiErrorModel(
          code: ResponseCode.incorrectInput,
          message: error?.response?.data['message']??ResponseMessage.incorrectInput,
          isSuccess: false,
          details:(error?.response?.data['errors'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),
        );
      case DataSource.serverError:
        return ApiErrorModel(
          code: ResponseCode.internalServerError,
          message:error?.response?.data['message']?? ResponseMessage.internalServerError,
          isSuccess: false,
          details:(error?.response?.data['errors'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),

        );
      case DataSource.noInternet:
        return ApiErrorModel(
          code: ResponseCode.noInternet,
          message:error?.response?.data['message']?? ResponseMessage.noInternet,
          isSuccess: false,
          details:(error?.response?.data['errors'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),

        );
      case DataSource.timeout:
        return ApiErrorModel(
          code: ResponseCode.timeout,
          message:error?.response?.data['message']?? ResponseMessage.timeout,
          isSuccess: false,
          details: error?.response?.data['errors'],

        );
      case DataSource.cancel:
        return ApiErrorModel(
          code: ResponseCode.cancel,
          message:error?.response?.data['message']?? ResponseMessage.cancel,
          isSuccess: false,
          details:(error?.response?.data['errors'] as List<dynamic>)
              .map((e) => e as Map<String, dynamic>)
              .toList(),

        );
      default:
        return ApiErrorModel(
          code: ResponseCode.unknown,
          message: ResponseMessage.unknown,
          isSuccess: false,
        );
    }
  }
}

/// Class for handling API errors and exceptions
class ErrorHandler implements Exception {
  late final ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    // if (error is DioException) {
    //
    // } else {
    //   apiErrorModel = DataSource.unknown.getResponse(error:error);
    // }
    apiErrorModel = _handleDioError(error);
  }

  /// Check network connectivity
  static Future<bool> isNetworkConnected() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult.last != ConnectivityResult.none;
  }
}

/// Private method to handle DioException errors
ApiErrorModel _handleDioError(DioException error) {

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return DataSource.timeout.getResponse(error:error);

    case DioExceptionType.badCertificate:
    case DioExceptionType.connectionError:
      return DataSource.noInternet.getResponse(error:error);

    case DioExceptionType.cancel:
      return DataSource.cancel.getResponse(error:error);

    case DioExceptionType.badResponse:
      if (error.response != null && error.response!.statusCode != null) {

        switch (error.response!.statusCode) {
          case ResponseCode.unauthorized:

            return DataSource.unauthorized.getResponse(error:error);

          case ResponseCode.incorrectInput:
            return DataSource.incorrectInput.getResponse(error:error);
            //return DataSource.incorrectInput.getResponse();
          case ResponseCode.internalServerError:
            return DataSource.serverError.getResponse(error:error);
          default:
            return _parseErrorResponse(error.response);
        }
      }

      return DataSource.unknown.getResponse(error:error);

    default:
      return DataSource.unknown.getResponse(error:error);
  }
}

/// Parse error response to extract custom error information if available
ApiErrorModel _parseErrorResponse(Response? response) {
  if (_isValidErrorResponse(response)) {
    try {
      // Try to extract custom error model from response data
      return ApiErrorModel.fromJson(response!.data);
    } catch (e) {
      // If parsing fails, return a default error with the status code
      return ApiErrorModel(
        code: response!.statusCode,
        message: response.statusMessage ?? ResponseMessage.unknown,
        isSuccess: false,

      );
    }
  }
  return DataSource.unknown.getResponse();
}

/// Helper method to check if error response is valid
bool _isValidErrorResponse(Response? response) {
  return response != null &&
      response.statusCode != null &&
      response.data != null;
}

/// Class containing API internal status codes
class ApiInternalStatus {
  const ApiInternalStatus._();

  static const int success = 0;
  static const int failure = 1;
}