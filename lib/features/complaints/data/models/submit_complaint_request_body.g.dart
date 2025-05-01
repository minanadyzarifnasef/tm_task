// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_complaint_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitComplaintRequestBody _$SubmitComplaintRequestBodyFromJson(
        Map<String, dynamic> json) =>
    SubmitComplaintRequestBody(
      name: json['name'] as String?,
      complaintsId: (json['complaintsId'] as num?)?.toInt(),
      phone: json['phone'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$SubmitComplaintRequestBodyToJson(
        SubmitComplaintRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'complaintsId': instance.complaintsId,
      'details': instance.details,
    };
