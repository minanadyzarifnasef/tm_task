import 'package:json_annotation/json_annotation.dart';
import 'package:tamweelytask/core/models/name_model.dart';

import '../../../../core/models/abstract_language_model.dart';

part 'complaint_types_response.g.dart';

@JsonSerializable()
class ComplaintTypesResponse {

  @JsonKey(name: 'recipes')
  List<ComplaintTypeModel>? complaintsTypes;


  ComplaintTypesResponse(
      {
        this.complaintsTypes
      });

  factory ComplaintTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$ComplaintTypesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintTypesResponseToJson(this);
}
@JsonSerializable()
class ComplaintTypeModel extends AbstractLanguageModel{
  int? id;
  @JsonKey(name: 'name')
  String? typeName;

  ComplaintTypeModel({
    this.typeName,
    this.id,

  });

  factory ComplaintTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ComplaintTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComplaintTypeModelToJson(this);

  @override
  Name? get name => Name(ar: typeName, en: typeName);

}