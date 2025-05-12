import 'package:book_mart/core/netwoking/api_error_handler.dart';
import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/features/manage_profile/data/models/user_profile_response.dart';
import 'package:book_mart/features/manage_profile/data/networking/complete_profile_api_service.dart';
import 'package:dio/dio.dart';

class CompleteProfileRepo{
  final CompleteProfileApiService completeProfileApiService ;
  CompleteProfileRepo( this.completeProfileApiService);

  Future<ApiResult<UserProfileResponse>> completeProfile(FormData formData)async{
    try {
     final result = await completeProfileApiService.completeProfile(formData);
      return  ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }


}