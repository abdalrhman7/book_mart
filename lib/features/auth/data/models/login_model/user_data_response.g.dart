// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.token,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
    )
      ..address = json['address'] as String?
      ..city = json['city'] as String?
      ..phone = json['phone'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'city': instance.city,
      'phone': instance.phone,
      'image': instance.image,
    };
