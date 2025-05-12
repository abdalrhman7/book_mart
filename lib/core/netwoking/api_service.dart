// import 'dart:io';
//
// import 'package:book_mart/features/login/data/models/login_request_body.dart';
// import 'package:book_mart/features/login/data/models/user_data_response.dart';
// import 'package:book_mart/features/sign_up/data/models/sign_up_request_body.dart';
// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
//
// import 'api_constants.dart';
//
// part 'api_service.g.dart';
//
// @RestApi(baseUrl: ApiConstants.baseUrl)
// abstract class BaseApiService {
//   factory BaseApiService(Dio dio, {String baseUrl}) = _BaseApiService;
// }
//
//
// // @GET(ApiConstants.getRecentlyJobs)
// // Future<JobsModel> getRecentlyJobs();
// //
// //
// // @POST(ApiConstants.savedJobs)
// // Future<void> addToSavedJob(@Body() Map<String, dynamic> body);
// //
// // @GET(ApiConstants.savedJobs)
// // Future<SavedJobModel> getSavedJob();
// //
// // @DELETE(ApiConstants.removeFromSaved + '{id}')
// // Future<SavedJobModel> deleteSavedJob(@Path() String id);
// //
// // @POST(ApiConstants.apply)
// // Future<void> applyJob(@Body() FormData formData);
// //
// // @GET(ApiConstants.getChat)
// // Future<ChatModel> getChat(@Body() Map<String, dynamic> body);
// //
// // @POST(ApiConstants.sendMessageFromUser)
// // Future<void> sendMessage(@Body() SendMassageDataModel sendMassageDataModel);
// //
// // @GET(ApiConstants.getApply + '{id}')
// // Future<ApplyModel> getAppliedJob(@Path() String id);
// //
// // @GET(ApiConstants.getUserProfile)
// // Future<ProfileModel> getProfileData();