import 'package:book_mart/core/netwoking/api_error_handler.dart';
import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/features/checkout/date/model/checkout_model.dart';
import 'package:book_mart/features/checkout/date/model/place_order_request_body.dart';
import 'package:book_mart/features/checkout/date/networking/checkout_api_service.dart';

class CheckoutRepo {
  final CheckoutApiService checkoutApiService ;
  CheckoutRepo(this.checkoutApiService);


  Future<ApiResult<CheckoutData>> getCartItems() async{
    try {
      final response = await checkoutApiService.getCartItems();
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }


  Future<ApiResult<bool>> placeOrder(PlaceOrderRequestBody placeOrderRequestBody) async{
    try {
     await checkoutApiService.placeOrder(placeOrderRequestBody);
      return const ApiResult.success(true);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }

  }
}
