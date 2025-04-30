import 'package:json_annotation/json_annotation.dart';

part 'name_model.g.dart';

@JsonSerializable()
class Name /*extends LanguageModel*/ {
  String? ar;
  String? en;
  String? code;

  Name({this.ar, this.en,this.code});



  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}
