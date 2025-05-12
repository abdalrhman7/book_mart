import 'package:book_mart/core/payment/model/paymob_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'paymob_api_service.g.dart';

@RestApi(baseUrl: 'https://accept.paymob.com/api')
abstract class PaymobApiService {
  factory PaymobApiService(Dio dio) = _PaymobApiService;

  // ✅ Step 1: Authentication
  @POST('/auth/tokens')
  Future<PaymobAuthResponse> getAuthToken(@Body() Map<String, dynamic> body);


  // ✅ Step 2: Create order
  @POST('/ecommerce/orders')
  Future<PaymobOrderResponse> createOrder(
      @Body() Map<String, dynamic> body,
      );

  // ✅ Step 3: Get payment key
  @POST('/acceptance/payment_keys')
  Future<PaymobPaymentKeyResponse> getPaymentKey(
      @Body() Map<String, dynamic> body,
      );
}
