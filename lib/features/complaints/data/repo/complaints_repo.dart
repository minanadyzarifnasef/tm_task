import 'package:dio/dio.dart';
import 'package:tamweelytask/features/complaints/data/models/complaint_types_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/safe_call.dart';

class ComplaintsRepo extends BaseRepository{
  final ApiService _apiService;

  ComplaintsRepo(this._apiService);

  Future<ApiResult<ComplaintTypesResponse>> getComplaintTypes() async {
    try {
      return await safeApiCall(() => _apiService.getComplaintsType());
    } catch (e) {
      if (e is DioException) {
        final errorHandler = ErrorHandler.handle(e);
        return ApiResult.failure(errorHandler.apiErrorModel);
      }
      return ApiResult.failure(DataSource.unknown.getResponse());
    }
  }


  Future<ApiResult<dynamic>> submitComplaint(body) async {
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