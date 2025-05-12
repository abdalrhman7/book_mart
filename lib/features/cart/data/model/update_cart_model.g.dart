// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartModel _$UpdateCartModelFromJson(Map<String, dynamic> json) =>
    UpdateCartModel(
      cartItemId: (json['cart_item_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$UpdateCartModelToJson(UpdateCartModel instance) =>
    <String, dynamic>{
      'cart_item_id': instance.cartItemId,
      'quantity': instance.quantity,
    };
