import 'package:dio/dio.dart';

import '../datasources/api_error_handler.dart';
import '../datasources/api_result.dart';
import '../datasources/api_service.dart';
import '../datasources/safe_call.dart';
import '../models/products/products_response.dart';


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