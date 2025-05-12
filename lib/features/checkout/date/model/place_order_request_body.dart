import 'package:json_annotation/json_annotation.dart';

part 'place_order_request_body.g.dart';

@JsonSerializable()
class PlaceOrderRequestBody {
  final String name;
  @JsonKey(name: 'governorate_id')
  final String governorateId;
  final String email;
  final String address;
  final String phone;

  PlaceOrderRequestBody({
    required this.name,
    required this.governorateId,
    required this.email,
    required this.address,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$PlaceOrderRequestBodyToJson(this);
}
