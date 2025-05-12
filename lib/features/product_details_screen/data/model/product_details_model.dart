import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel{
  final BookModel data;

  ProductDetailsModel({required this.data});


  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => _$ProductDetailsModelFromJson(json);
}
