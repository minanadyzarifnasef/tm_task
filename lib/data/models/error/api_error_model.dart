import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;

  List<Map<String, dynamic>> ?details;
  final bool isSuccess;

  ApiErrorModel({
    required this.message,
    this.code,
    this.details,
    this.isSuccess = false,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getUserFriendlyMessage() {
    return message ?? "An unexpected error occurred. Please try again later.";
  }
}