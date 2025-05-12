import 'dart:convert';

import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/core/helper/shared_pref_helper.dart';
import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:book_mart/features/profile/data/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());

  final ProfileRepo profileRepo;

  void logout()async{
    emit(LogoutLoading());
    var result = await profileRepo.logout();
    result.when(
      success: (_)async {
        await SharedPrefHelper.removeSecuredString(
            SharedPrefKeys.userToken);
        await SharedPrefHelper.removeData(SharedPrefKeys.userData);
        emit(LogoutSuccess());
      },
      failure: (ApiErrorModel error) {
        emit(LogoutFailure(error));
      },
    );
  }

  Future<void> getUserData()async{
    emit(GetUserDataLoading());
    final String userDataJson = await SharedPrefHelper.getString(SharedPrefKeys.userData);
    emit(GetUserDataSuccess(User.fromJson(jsonDecode(userDataJson))));
  }
}
