// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutModel _$CheckoutModelFromJson(Map<String, dynamic> json) =>
    CheckoutModel(
      data: CheckoutData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckoutModelToJson(CheckoutModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CheckoutData _$CheckoutDataFromJson(Map<String, dynamic> json) => CheckoutData(
      id: (json['id'] as num).toInt(),
      total: json['total'] as String,
      cartItems: (json['cart_items'] as List<dynamic>)
          .map((e) => CheckoutCartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckoutDataToJson(CheckoutData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'cart_items': instance.cartItems,
    };

CheckoutCartItem _$CheckoutCartItemFromJson(Map<String, dynamic> json) =>
    CheckoutCartItem(
      itemId: (json['item_id'] as num).toInt(),
      productId: (json['item_product_id'] as num).toInt(),
      name: json['item_product_name'] as String,
      price: json['item_product_price'] as String,
      quantity: (json['item_quantity'] as num).toInt(),
      total: json['item_total'] as String,
    );

Map<String, dynamic> _$CheckoutCartItemToJson(CheckoutCartItem instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_product_id': instance.productId,
      'item_product_name': instance.name,
      'item_product_price': instance.price,
      'item_quantity': instance.quantity,
      'item_total': instance.total,
    };
