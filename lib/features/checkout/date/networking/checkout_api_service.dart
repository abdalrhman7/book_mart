import 'package:book_mart/core/netwoking/api_constants.dart';
import 'package:book_mart/features/checkout/date/model/checkout_model.dart';
import 'package:book_mart/features/checkout/date/model/place_order_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'checkout_api_service.g.dart';


@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CheckoutApiService {
  factory CheckoutApiService(Dio dio) = _CheckoutApiService;


  @GET(ApiConstants.checkout)
  Future<CheckoutModel> getCartItems();

  @POST(ApiConstants.placeOrder)
  Future<void> placeOrder(@Body() PlaceOrderRequestBody placeOrderRequestBody);

}