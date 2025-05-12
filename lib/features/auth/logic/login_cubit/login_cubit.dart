import 'dart:convert';

import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/core/helper/shared_pref_helper.dart';
import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/core/netwoking/dio_factory.dart';
import 'package:book_mart/features/auth/data/models/login_model/login_request_body.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:book_mart/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());

  final AuthRepo _loginRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(LoginLoading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
      success: (UserDataResponse loginResponse) async{
        if(loginResponse.data!.user!.isUserDataComplete()) {
          await SharedPrefHelper.setData(SharedPrefKeys.isProfileComplete, true);
        }
        emit(LoginSuccess());
        saveUserDataAndToken(
          token: loginResponse.data!.token ?? '',
          userData: loginResponse.data!.user!,
        );
      },
      failure: (errorMessage) {
        emit(LoginFailure(errorMessage));
      },
    );
  }

  Future<void> saveUserDataAndToken({
    required String token,
    required User userData,
  }) async {
    DioFactory.setTokenIntoHeaderAfterLogin(token);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
    final String userDataJson = jsonEncode(userData.toJson());
    await SharedPrefHelper.setData(SharedPrefKeys.userData, userDataJson);
  }
}
