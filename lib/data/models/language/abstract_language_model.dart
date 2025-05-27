

import 'package:tamweelytask/core/utils/extension.dart';

import 'name_model.dart';

abstract class AbstractLanguageModel{
  Name? get name;

  String getName() {
    return name?.getNameByLanguageCode() ?? '';
  }
}