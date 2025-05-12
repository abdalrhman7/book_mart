// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      data: ProductData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) => ProductData(
      products: (json['products'] as List<dynamic>)
          .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      discount: (json['discount'] as num).toInt(),
      priceAfterDiscount: (json['price_after_discount'] as num).toInt(),
      image: json['image'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'discount': instance.discount,
      'price_after_discount': instance.priceAfterDiscount,
      'image': instance.image,
      'category': instance.category,
    };
