
import 'package:json_annotation/json_annotation.dart';

part 'slider_images_model.g.dart';

@JsonSerializable()
class SliderImagesModel {
  final SliderImagesData data;

  SliderImagesModel({required this.data});

  factory SliderImagesModel.fromJson(Map<String, dynamic> json) => _$SliderImagesModelFromJson(json);
}

@JsonSerializable()
class SliderImagesData {
  @JsonKey(name: 'sliders')
  final List<SliderImages> images;

  SliderImagesData({required this.images});

  factory SliderImagesData.fromJson(Map<String, dynamic> json) => _$SliderImagesDataFromJson(json);
}

@JsonSerializable()
class SliderImages {
  final String image;

  SliderImages({required this.image});

  factory SliderImages.fromJson(Map<String, dynamic> json) => _$SliderImagesFromJson(json);
}