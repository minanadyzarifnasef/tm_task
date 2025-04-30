
import '../models/name_model.dart';
import 'app_utilities.dart';

extension NameExtension on Name {
  String? getNameByLanguageCode() {
    switch (AppUtilities().getAppLanguage()) {
      case 'ar':
        return ar;
      case 'en':
        return en;
      default:
        return AppUtilities().getDeviceLanguage();
    }
  }
}