import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/core/helper/shared_pref_helper.dart';
import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/core/netwoking/dio_factory.dart';
import 'package:book_mart/features/auth/data/models/sign_up_model/sign_up_request_body.dart';
import 'package:book_mart/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authRepo) : super(SignUpInitial());

  final AuthRepo _authRepo;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(SignUpLoading());
    final response = await _authRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      ),
    );
    response.when(success: (registerResponse) {
      emit(SignUpSuccess());
      saveUserToken(token: registerResponse.data!.token ?? '');
    }, failure: (errorMessage) {
      emit(SignUpFailure(errorMessage));
    });
  }

  Future<void> saveUserToken({
    required String token,
  }) async {
    DioFactory.setTokenIntoHeaderAfterLogin(token);
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  }
}
