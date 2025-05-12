import 'package:book_mart/core/netwoking/api_error_handler.dart';
import 'package:book_mart/features/auth/data/models/forget_password_model/reset_password_request_body.dart';
import 'package:book_mart/features/auth/data/models/login_model/login_request_body.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:book_mart/features/auth/data/models/sign_up_model/sign_up_request_body.dart';
import 'package:book_mart/features/auth/data/networking/auth_api_service.dart';

import '../../../../core/netwoking/api_result.dart';

class AuthRepo {
  final AuthApiService _apiService;

  AuthRepo(this._apiService);

  Future<ApiResult<UserDataResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
     var response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserDataResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      var response =  await _apiService.signUp(signupRequestBody);
      return  ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<bool>> sendOTP(
      String email) async {
    try {
      await _apiService.sendOtp({
        'email': email
      });
      return const ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<bool>> checkOtp(
      String otp) async {
    try {
      await _apiService.checkOtp(
        {
          'verify_code': otp
        }
      );
      return const ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<bool>> resetPassword(
      ResetPasswordRequestBody resetPasswordRequestBody) async {
    try {
      await _apiService.resetPassword(resetPasswordRequestBody);
      return const ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

}
