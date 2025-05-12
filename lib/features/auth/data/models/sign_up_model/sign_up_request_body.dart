import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';
@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;

  SignupRequestBody({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}