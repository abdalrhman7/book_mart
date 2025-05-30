import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel{
  final ProductData data;

  ProductModel({required this.data});


  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}


@JsonSerializable()
class ProductData{
  final List<BookModel> products;

  ProductData({required this.products});

  factory ProductData.fromJson(Map<String, dynamic> json) => _$ProductDataFromJson(json);
}


@JsonSerializable()
class BookModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final int discount;
  @JsonKey(name: 'price_after_discount')
  final int priceAfterDiscount;
  final String image;
  final String category;


  BookModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.image,
    required this.category,
  });


  factory BookModel.fromJson(Map<String, dynamic> json) => _$BookModelFromJson(json);

  int get priceAsInt => int.parse(price);

}
