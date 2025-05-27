// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_types_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintTypesResponse _$ComplaintTypesResponseFromJson(
        Map<String, dynamic> json) =>
    ComplaintTypesResponse(
      complaintsTypes: (json['recipes'] as List<dynamic>?)
          ?.map((e) => ComplaintTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComplaintTypesResponseToJson(
        ComplaintTypesResponse instance) =>
    <String, dynamic>{
      'recipes': instance.complaintsTypes,
    };

ComplaintTypeModel _$ComplaintTypeModelFromJson(Map<String, dynamic> json) =>
    ComplaintTypeModel(
      typeName: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ComplaintTypeModelToJson(ComplaintTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.typeName,
    };
