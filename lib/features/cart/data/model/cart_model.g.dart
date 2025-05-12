// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      data: CartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'data': instance.data,
    };

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
      total: json['total'],
      cartItems: (json['cart_items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      'total': instance.total,
      'cart_items': instance.cartItems,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      itemId: (json['item_id'] as num).toInt(),
      productId: (json['item_product_id'] as num).toInt(),
      name: json['item_product_name'] as String,
      image: json['item_product_image'] as String,
      price: json['item_product_price'] as String,
      discount: (json['item_product_discount'] as num).toInt(),
      priceAfterDiscount:
          (json['item_product_price_after_discount'] as num).toDouble(),
      stock: (json['item_product_stock'] as num).toInt(),
      quantity: (json['item_quantity'] as num).toInt(),
      total: (json['item_total'] as num).toDouble(),
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'item_id': instance.itemId,
      'item_product_id': instance.productId,
      'item_product_name': instance.name,
      'item_product_image': instance.image,
      'item_product_price': instance.price,
      'item_product_discount': instance.discount,
      'item_product_price_after_discount': instance.priceAfterDiscount,
      'item_product_stock': instance.stock,
      'item_quantity': instance.quantity,
      'item_total': instance.total,
    };
