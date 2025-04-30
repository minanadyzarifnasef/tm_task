import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

import '../../features/contactUs/data/models/contact_us_request_body.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio,
      {String? baseUrl, ParseErrorLogger? errorLogger}) = _ApiService;

  @GET(ApiConstants.submitContactUs)
  Future<dynamic> submitMessage(
      @Body() ContactUsRequestBody body
      );

}
