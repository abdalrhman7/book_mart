// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderRequestBody _$PlaceOrderRequestBodyFromJson(
        Map<String, dynamic> json) =>
    PlaceOrderRequestBody(
      name: json['name'] as String,
      governorateId: json['governorate_id'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$PlaceOrderRequestBodyToJson(
        PlaceOrderRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'governorate_id': instance.governorateId,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
    };
