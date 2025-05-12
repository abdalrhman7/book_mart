import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@JsonSerializable()
class CategoriesModel {
  final CategoriesData data;

  CategoriesModel({
    required this.data,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => _$CategoriesModelFromJson(json);

}

@JsonSerializable()
class CategoriesData {
  final List<Categories> categories;

  CategoriesData({
    required this.categories,
  });

  factory CategoriesData.fromJson(Map<String, dynamic> json) => _$CategoriesDataFromJson(json);

}

@JsonSerializable()
class Categories {
  final int id;
  final String name;

  Categories({
    required this.id,
    required this.name,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => _$CategoriesFromJson(json);

}