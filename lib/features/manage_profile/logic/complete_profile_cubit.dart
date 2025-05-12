import 'dart:convert';
import 'dart:io';

import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/core/helper/shared_pref_helper.dart';
import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/features/manage_profile/data/models/complete_profile_request_body.dart';
import 'package:book_mart/features/manage_profile/data/models/user_profile_response.dart';
import 'package:book_mart/features/manage_profile/data/repo/complete_profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit(this.completeProfileRepo) : super(CompleteProfileInitial());
  final CompleteProfileRepo completeProfileRepo;
  final formKey = GlobalKey<FormState>();

  File? file;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  void pickImage() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery , imageQuality: 70);
    if (image != null) {
      file = File(image.path);
      emit(ImagePickedSuccess());
    }
  }


  Future<void> emitCompleteProfileStates(bool? isUpdateProfile) async {
    emit(CompleteProfileLoading());
    final completeProfileData = CompleteProfileRequestBody(
      name: nameController.text,
      address: addressController.text,
      city: cityController.text,
      phone: phoneController.text,
      imageFile: file,
    );
    final response = await completeProfileRepo.completeProfile(
        completeProfileData.toFormData(),
    );
    response.when(success: (userDataResponse) async{
      if (isUpdateProfile == true) {
       await saveUserData(userData: userDataResponse.data);
        emit(UpdateProfileSuccess());
      }else{
       await saveUserData(userData: userDataResponse.data);
        emit(CompleteProfileSuccess());
      }

    }, failure: (errorMessage) {
      emit(CompleteProfileFailure(errorMessage));
    });
  }

  Future<void> saveUserData({
    required UserProfileData userData,
  }) async {
    final String userDataJson = jsonEncode(userData.toJson());
    print('userDataJson : $userDataJson');
    await SharedPrefHelper.setData(SharedPrefKeys.userData, userDataJson);
  }


}
