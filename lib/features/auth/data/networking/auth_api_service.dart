import 'package:book_mart/core/netwoking/api_constants.dart';
import 'package:book_mart/features/auth/data/models/forget_password_model/reset_password_request_body.dart';
import 'package:book_mart/features/auth/data/models/login_model/login_request_body.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:book_mart/features/auth/data/models/sign_up_model/sign_up_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

  part 'auth_api_service.g.dart';

  @RestApi(baseUrl: ApiConstants.baseUrl)
  abstract class AuthApiService {
    factory AuthApiService(Dio dio) = _AuthApiService;

    @POST(ApiConstants.login)
    Future<UserDataResponse> login(@Body() LoginRequestBody loginRequestBody);

    @POST(ApiConstants.signUp)
    Future<UserDataResponse> signUp(@Body() SignupRequestBody signupRequestBody);

    @POST(ApiConstants.sendOTP)
    Future<void> sendOtp(@Body() Map<String, String> email);

    @POST(ApiConstants.checkOTP)
    Future<void> checkOtp (@Body() Map<String, String> otp);

    @POST(ApiConstants.resetPassword)
    Future<void> resetPassword (@Body() ResetPasswordRequestBody resetPasswordRequestBody);
  }