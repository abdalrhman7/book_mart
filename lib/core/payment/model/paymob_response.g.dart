// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymob_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymobAuthResponse _$PaymobAuthResponseFromJson(Map<String, dynamic> json) =>
    PaymobAuthResponse(
      token: json['token'] as String,
    );

Map<String, dynamic> _$PaymobAuthResponseToJson(PaymobAuthResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

PaymobOrderResponse _$PaymobOrderResponseFromJson(Map<String, dynamic> json) =>
    PaymobOrderResponse(
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$PaymobOrderResponseToJson(
        PaymobOrderResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

PaymobPaymentKeyResponse _$PaymobPaymentKeyResponseFromJson(
        Map<String, dynamic> json) =>
    PaymobPaymentKeyResponse(
      token: json['token'] as String,
    );

Map<String, dynamic> _$PaymobPaymentKeyResponseToJson(
        PaymobPaymentKeyResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };
