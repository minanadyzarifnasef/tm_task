import 'package:json_annotation/json_annotation.dart';

part 'submit_complaint_request_body.g.dart';

@JsonSerializable()
class SubmitComplaintRequestBody {
  String? name;

  String? phone;

  int ? complaintsId;

  String? details;


  SubmitComplaintRequestBody(
      {
       this.name,this.complaintsId,this.phone,this.details
      });

  factory SubmitComplaintRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SubmitComplaintRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitComplaintRequestBodyToJson(this);
}