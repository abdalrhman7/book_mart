import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final CartData data;

  const CartModel({required this.data});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}

@JsonSerializable()
class CartData {
  final dynamic total;

  @JsonKey(name: 'cart_items')
  final List<CartItem> cartItems;

  CartData({
    required this.total,
    required this.cartItems,
  });

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataToJson(this);

  String get cartTotalPriceAsString {
    double parsedTotal = double.tryParse(total.toString()) ?? 0.0;

    return parsedTotal.truncateToDouble() == parsedTotal
        ? parsedTotal.toStringAsFixed(0)
        : parsedTotal.toStringAsFixed(2);
  }
}

@JsonSerializable()
class CartItem{
  @JsonKey(name: 'item_id')
  final int itemId;

  @JsonKey(name: 'item_product_id')
  final int productId;

  @JsonKey(name: 'item_product_name')
  final String name;

  @JsonKey(name: 'item_product_image')
  final String image;

  @JsonKey(name: 'item_product_price')
  final String price;

  @JsonKey(name: 'item_product_discount')
  final int discount;

  @JsonKey(name: 'item_product_price_after_discount')
  final double priceAfterDiscount;

  @JsonKey(name: 'item_product_stock')
  final int stock;

  @JsonKey(name: 'item_quantity')
  final int quantity;

  @JsonKey(name: 'item_total')
  final double total;

  CartItem({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.stock,
    required this.quantity,
    required this.total,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
