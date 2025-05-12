import 'package:book_mart/core/helper/extensions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  @JsonKey(name: 'status')
  final int? code;
  final Map<String, dynamic>? errors;

  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);

  String getAllErrorsMessages() {
    if (errors.isNullOrEmpty()) return message ?? 'Unknown error occurred';

    final errorMessages = errors!.entries.map((entry) {
      final value = entry.value;
      return '${value.join(',')}';
    }).join('\n');

    return errorMessages;
  }
}
