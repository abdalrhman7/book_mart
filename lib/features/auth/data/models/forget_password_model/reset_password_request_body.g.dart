// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordRequestBody _$ResetPasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordRequestBody(
      password: json['new_password'] as String,
      confirmPassword: json['new_password_confirmation'] as String,
      verifyCode: json['verify_code'] as String,
    );

Map<String, dynamic> _$ResetPasswordRequestBodyToJson(
        ResetPasswordRequestBody instance) =>
    <String, dynamic>{
      'new_password': instance.password,
      'new_password_confirmation': instance.confirmPassword,
      'verify_code': instance.verifyCode,
    };
