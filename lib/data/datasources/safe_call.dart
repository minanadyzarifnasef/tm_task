import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'api_error_handler.dart';
import 'api_result.dart';

abstract class BaseRepository {
  Future<ApiResult<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
    try {
      if (!await ErrorHandler.isNetworkConnected()) {
        return ApiResult.failure(DataSource.noInternet.getResponse());
      }

      final response = await apiCall();
      return ApiResult.success(response);
    } on DioException catch (error) {

      final errorHandler = ErrorHandler.handle(error);
      debugPrint("DioException Safe Call error is ${error.toString()}");
      return ApiResult.failure(errorHandler.apiErrorModel);
    } catch (error) {
      debugPrint(" not DioException Safe Call error is ${error.toString()}");
      return ApiResult.failure(DataSource.unknown.getResponse());
    }
  }
}

