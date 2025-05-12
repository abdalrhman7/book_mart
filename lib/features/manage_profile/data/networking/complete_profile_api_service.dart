import 'package:book_mart/core/netwoking/api_constants.dart';
import 'package:book_mart/features/manage_profile/data/models/user_profile_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'complete_profile_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CompleteProfileApiService{
  factory CompleteProfileApiService(Dio dio) = _CompleteProfileApiService;

  @POST(ApiConstants.updateProfile)
  Future<UserProfileResponse> completeProfile(@Body() FormData formData);
}