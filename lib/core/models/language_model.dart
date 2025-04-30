import 'package:json_annotation/json_annotation.dart';

import 'abstract_language_model.dart';
import 'name_model.dart';

part 'language_model.g.dart';

@JsonSerializable()
class LanguageModel extends AbstractLanguageModel {
  @override

  Name?name;

  LanguageModel({this.name, });



  factory LanguageModel.fromJson(Map<String, dynamic> json) => _$LanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageModelToJson(this);
}
