import 'package:dio/dio.dart';

import '../datasources/api_error_handler.dart';
import '../datasources/api_result.dart';
import '../datasources/api_service.dart';
import '../datasources/safe_call.dart';



class ContactUsRepo extends BaseRepository{
  final ApiService _apiService;

  ContactUsRepo(this._apiService);

  Future<ApiResult<dynamic>> submitMessage(body) async {
    try {
      // this in normal scenario but now we will simulate submitting the form
      //return await safeApiCall(() => _apiService.submitMessage(body));
      return await safeApiCall(() => Future.delayed(const Duration(seconds: 3),(){}));
    } catch (e) {
      if (e is DioException) {
        final errorHandler = ErrorHandler.handle(e);
        return ApiResult.failure(errorHandler.apiErrorModel);
      }
      return ApiResult.failure(DataSource.unknown.getResponse());
    }
  }
}