// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponse _$UserProfileResponseFromJson(Map<String, dynamic> json) =>
    UserProfileResponse(
      data: UserProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResponseToJson(
        UserProfileResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

UserProfileData _$UserProfileDataFromJson(Map<String, dynamic> json) =>
    UserProfileData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$UserProfileDataToJson(UserProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'city': instance.city,
      'phone': instance.phone,
      'image': instance.image,
    };
