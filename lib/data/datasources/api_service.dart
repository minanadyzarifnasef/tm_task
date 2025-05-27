import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../models/complaints/complaint_types_response.dart';
import '../models/products/products_response.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio,
      {String? baseUrl, ParseErrorLogger? errorLogger}) = _ApiService;

  @GET(ApiConstants.getProducts)
  Future<ProductsResponse> getProducts();

  @GET(ApiConstants.getComplaintsType)
  Future<ComplaintTypesResponse> getComplaintsType();

}
