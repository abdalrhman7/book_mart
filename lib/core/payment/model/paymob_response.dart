import 'package:json_annotation/json_annotation.dart';

part 'paymob_response.g.dart';

@JsonSerializable()
class PaymobAuthResponse {
  final String token;

  PaymobAuthResponse({required this.token});

  factory PaymobAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymobAuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymobAuthResponseToJson(this);
}

@JsonSerializable()
class PaymobOrderResponse {
  final int id;

  PaymobOrderResponse({required this.id});

  factory PaymobOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymobOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymobOrderResponseToJson(this);
}

@JsonSerializable()
class PaymobPaymentKeyResponse {
  final String token;

  PaymobPaymentKeyResponse({required this.token});

  factory PaymobPaymentKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymobPaymentKeyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymobPaymentKeyResponseToJson(this);
}
