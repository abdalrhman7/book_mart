import 'package:dio/dio.dart';
import 'dart:io';

class CompleteProfileRequestBody {
  final String name;
  final String address;
  final String city;
  final String phone;
  final File? imageFile;

  CompleteProfileRequestBody({
    required this.name,
    required this.address,
    required this.city,
    required this.phone,
    this.imageFile,
  });

  FormData toFormData() {
    final data = <String, dynamic>{
      'name': name,
      'address': address,
      'city': city,
      'phone': phone,
    };

    if (imageFile != null) {
      data['image'] = MultipartFile.fromFileSync(
        imageFile!.path,
        filename: imageFile!.path.split('/').last,
      );
    }
    print('MultipartFile$data');

    return FormData.fromMap(data);
  }
}


