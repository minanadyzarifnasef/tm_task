

import 'package:tamweelytask/core/helpers/name_extention.dart';

import 'name_model.dart';

abstract class AbstractLanguageModel{
  Name? get name;

  String getName() {
    return name?.getNameByLanguageCode() ?? '';
  }
}