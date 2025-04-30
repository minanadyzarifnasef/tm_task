// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactUsRequestBody _$ContactUsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ContactUsRequestBody(
      message: json['message'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ContactUsRequestBodyToJson(
        ContactUsRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'message': instance.message,
    };
