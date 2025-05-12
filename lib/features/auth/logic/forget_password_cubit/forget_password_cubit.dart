import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/features/auth/data/models/forget_password_model/reset_password_request_body.dart';
import 'package:book_mart/features/auth/data/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());

  final AuthRepo authRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void sendOtp() async {
    emit(SendOtpLoading());

    var result = await authRepo.sendOTP(emailController.text);
    result.when(
      success: (data) {
        emit(SendOtpSuccess());
      },
      failure: (ApiErrorModel error) {
        emit(SendOtpFailure(error));
      },
    );
  }

  void checkOtp() async {
    emit(CheckOtpLoading());
    var result = await authRepo.checkOtp(codeController.text);
    result.when(
      success: (data) {
        emit(CheckOtpSuccess());
      },
      failure: (ApiErrorModel error) {
        emit(CheckOtpFailure(error));
      },
    );
  }

  void resetPassword() async {
    emit(ResetPasswordLoading());
    var result = await authRepo.resetPassword(
      ResetPasswordRequestBody(
        verifyCode: codeController.text,
        password: newPasswordController.text,
        confirmPassword: confirmPasswordController.text,
      ),
    );
    result.when(
      success: (data) {
        emit(ResetPasswordSuccess());
      },
      failure: (ApiErrorModel error) {
        emit(ResetPasswordFailure(error));
      },
    );
  }
}
