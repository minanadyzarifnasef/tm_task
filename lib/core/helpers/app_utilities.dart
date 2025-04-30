import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../services/navigation_service.dart';

class AppUtilities {
  static final AppUtilities _instance = AppUtilities._internal();

  static AppUtilities get instance => _instance;




  factory AppUtilities() {
    return _instance;
  }

  AppUtilities._internal();
  Future<void> init() async {

    await _getSavedData();
    debugPrint("initialize app Successfully");
  }

  final FlutterSecureStorage _storage = const FlutterSecureStorage();


  bool get isLTR {
    return getAppLanguage() == "en";
  }

  void setLocality(String code) async {
    NavigationService.navigatorKey.currentContext?.setLocale(Locale(code));
  }

  String getDeviceLanguage() {
    return Platform.localeName.split('_')[0];
  }
  String getAppLanguage() {
   return NavigationService.navigatorKey.currentContext!.locale.languageCode;
  }

  Future<bool> setSavedString(String key, String value) async {
    await _storage.write(key: key, value: value);
    return true; // SecureStorage does not return a success boolean
  }

  Future<String> getSavedString(String key, String defaultVal) async {
    final value = await _storage.read(key: key);
    return value ?? defaultVal;
  }

  Future<void> _getSavedData() async {
    //todo :get saved data from secure storage
    debugPrint("getting saved data from secure storage ...");
  }

}
