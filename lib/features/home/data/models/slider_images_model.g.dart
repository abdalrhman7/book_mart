// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SliderImagesModel _$SliderImagesModelFromJson(Map<String, dynamic> json) =>
    SliderImagesModel(
      data: SliderImagesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SliderImagesModelToJson(SliderImagesModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SliderImagesData _$SliderImagesDataFromJson(Map<String, dynamic> json) =>
    SliderImagesData(
      images: (json['sliders'] as List<dynamic>)
          .map((e) => SliderImages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SliderImagesDataToJson(SliderImagesData instance) =>
    <String, dynamic>{
      'sliders': instance.images,
    };

SliderImages _$SliderImagesFromJson(Map<String, dynamic> json) => SliderImages(
      image: json['image'] as String,
    );

Map<String, dynamic> _$SliderImagesToJson(SliderImages instance) =>
    <String, dynamic>{
      'image': instance.image,
    };
