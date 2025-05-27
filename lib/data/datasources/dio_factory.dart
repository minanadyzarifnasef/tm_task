import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    // await AppUtilities.instance
    //     .importantInitialize(); // Ensure data is loaded before creating Dio

    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
       ..options.headers = {
         "x-api-key": 'server x key',
         "device-id": "device id",
        // "lang": AppUtilities().getAppLanguage(),
      //   "os-type": Platform.isAndroid ? 'android' : "ios"
       };

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.addAll([
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
      ErrorInterceptor(),
      InterceptorsWrapper(
        onError: (DioException err, ErrorInterceptorHandler handler) {
          handler.next(err);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          handler.next(response);
        },
      ),
    ]);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check for network connectivity issues
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout) {
      final connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // Create a custom error for no internet
        final noInternetError = DioException(
          requestOptions: err.requestOptions,
          type: DioExceptionType.connectionError,
          error: 'No internet connection',
        );
        return handler.next(noInternetError);
      }
    }

    // Handle unauthorized errors (401)
    if (err.response?.statusCode == 401) {
      // You could trigger a logout or token refresh here
      // For example: AuthService.instance.logout();
    }

    // Pass the error to the next handler
    return handler.next(err);
  }
}