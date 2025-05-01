import 'package:dio/dio.dart';
import 'package:tamweelytask/features/products/data/models/products_response.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/networking/safe_call.dart';

class ProductsRepo extends BaseRepository{
  final ApiService _apiService;

  ProductsRepo(this._apiService);

  Future<ApiResult<ProductsResponse>> getProducts() async {
    try {

      return await safeApiCall(() => _apiService.getProducts());
    } catch (e) {
      if (e is DioException) {
        final errorHandler = ErrorHandler.handle(e);
        return ApiResult.failure(errorHandler.apiErrorModel);
      }
      return ApiResult.failure(DataSource.unknown.getResponse());
    }
  }
}