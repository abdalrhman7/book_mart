import 'package:json_annotation/json_annotation.dart';

part 'checkout_model.g.dart';

@JsonSerializable()
class CheckoutModel {
  final CheckoutData data;

  const CheckoutModel({
    required this.data,
  });

  factory CheckoutModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutModelToJson(this);
}

@JsonSerializable()
class CheckoutData {
  final int id;
  final String total;

  @JsonKey(name: 'cart_items')
  final List<CheckoutCartItem> cartItems;

  CheckoutData({
    required this.id,
    required this.total,
    required this.cartItems,
  });

  factory CheckoutData.fromJson(Map<String, dynamic> json) =>
      _$CheckoutDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutDataToJson(this);
}


@JsonSerializable()
class CheckoutCartItem {
  @JsonKey(name: 'item_id')
  final int itemId;

  @JsonKey(name: 'item_product_id')
  final int productId;

  @JsonKey(name: 'item_product_name')
  final String name;

  @JsonKey(name: 'item_product_price')
  final String price;

  @JsonKey(name: 'item_quantity')
  final int quantity;

  @JsonKey(name: 'item_total')
  final String total;

  CheckoutCartItem({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.total,
  });

  factory CheckoutCartItem.fromJson(Map<String, dynamic> json) =>
      _$CheckoutCartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutCartItemToJson(this);
}
