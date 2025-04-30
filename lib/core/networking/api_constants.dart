import 'package:easy_localization/easy_localization.dart';

class ApiConstants {
  //static const String apiBaseUrl = 'https://stage.api.gps-bank.com/';
  static const String apiBaseUrl = 'https://api.staging.gps.com.eg/';
  static const String submitContactUs = 'asd';

}

class ApiErrors {
  static const String unauthorizedError = "unauthorizedError";
  static  String incorrectInputError = 'incorrectInputError'.tr();
  static const String serverError = "serverError";
  static const String othersError = "othersError";
}