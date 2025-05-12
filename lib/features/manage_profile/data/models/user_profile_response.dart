import 'package:json_annotation/json_annotation.dart';

part 'user_profile_response.g.dart';

@JsonSerializable()
class UserProfileResponse {
  final UserProfileData data;


  UserProfileResponse({
    required this.data,

  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) => _$UserProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResponseToJson(this);
}

@JsonSerializable()
class UserProfileData {
  final int id;
  final String name;
  final String email;
  final String address;
  final String city;
  final String phone;
  final String image;

  UserProfileData({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.phone,
    required this.image,
  });

  factory UserProfileData.fromJson(Map<String, dynamic> json) => _$UserProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileDataToJson(this);
}
