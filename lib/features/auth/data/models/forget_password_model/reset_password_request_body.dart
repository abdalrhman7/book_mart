import 'package:json_annotation/json_annotation.dart';
part 'reset_password_request_body.g.dart';

@JsonSerializable()
class ResetPasswordRequestBody {
  @JsonKey(name: 'new_password')
  final String password;
  @JsonKey(name: 'new_password_confirmation')
  final String confirmPassword;
  @JsonKey(name: 'verify_code')
  final String verifyCode;

  ResetPasswordRequestBody({
    required this.password,
    required this.confirmPassword,
    required this.verifyCode,
  });

  Map<String, dynamic> toJson() => _$ResetPasswordRequestBodyToJson(this);
}
