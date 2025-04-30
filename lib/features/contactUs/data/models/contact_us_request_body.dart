import 'package:json_annotation/json_annotation.dart';

part 'contact_us_request_body.g.dart';

@JsonSerializable()
class ContactUsRequestBody {
  String? name;

  String? phone;

  String? message;


  ContactUsRequestBody(
      {
       this.message,this.name,this.phone
      });

  factory ContactUsRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ContactUsRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ContactUsRequestBodyToJson(this);
}