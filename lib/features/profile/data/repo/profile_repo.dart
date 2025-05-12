

import 'package:book_mart/core/netwoking/api_error_handler.dart';
import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/features/profile/data/networking/profile_api_service.dart';

class ProfileRepo{
  final ProfileApiService profileApiService ;

  ProfileRepo(this.profileApiService);

  Future<ApiResult> logout()async{
    try {
      await profileApiService.logout();
      return const ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}