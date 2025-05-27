import 'package:easy_localization/easy_localization.dart';

class ApiConstants {
  //static const String apiBaseUrl = 'https://stage.api.gps-bank.com/';
  static const String apiBaseUrl = 'https://dummyjson.com/';
  static const String submitContactUs = 'submitMessage';
  static const String getProducts = 'products';
  static const String getComplaintsType = 'recipes';
  static const String submitComplaints = 'submitComplaints';

}

class ApiErrors {
  static const String unauthorizedError = "unauthorizedError";
  static  String incorrectInputError = 'incorrectInputError'.tr();
  static const String serverError = "serverError";
  static const String othersError = "othersError";
}