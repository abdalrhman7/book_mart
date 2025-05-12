import 'package:book_mart/core/netwoking/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'profile_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileApiService{
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @POST(ApiConstants.logout)
  Future<void> logout();
}