import 'package:book_mart/core/constants/payment_keys.dart';
import 'package:book_mart/core/netwoking/api_error_handler.dart';
import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/core/netwoking/payment_api_services/paymob_api_services/paymob_api_service.dart';
import 'package:book_mart/core/payment/model/payment_input_model.dart';
import 'package:book_mart/core/payment/model/paymob_billing_data.dart';

class PayMopService {
  final PaymobApiService paymobApiService;

  PayMopService(this.paymobApiService);

  Future<ApiResult<String>> makePayment(PaymobPaymentInputModel input) async {
    try {
      final token = await _getAuthToken();
      final orderId = await _createOrder(token, input.amountCentsString);
      final paymentKey = await _getPaymentKey(token, orderId, input);
      return ApiResult.success(paymentKey);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<String> _getAuthToken() async {
    final response = await paymobApiService.getAuthToken({
      "api_key": PaymentKeys.payMopApiKey,
    });
    return response.token;
  }

  Future<int> _createOrder(String token, String amountCents) async {
    final response = await paymobApiService.createOrder({
      "auth_token": token,
      "amount_cents": amountCents,
      "currency": 'EGP',
      "delivery_needed": false,
      "items": [],
    });
    return response.id;
  }

  Future<String> _getPaymentKey(
      String token, int orderId, PaymobPaymentInputModel input) async {
    final billingData = PaymobBillingData(
      firstName: input.firstName!,
      lastName: input.lastName!,
      email: input.email!,
      phone: input.phone!,
    );

    final paymentKeyTokenResponse = await paymobApiService.getPaymentKey({
      "auth_token": token,
      "order_id": orderId,
      "amount_cents": input.amountCentsString,
      "currency": 'EGP',
      "expiration": 3600,
      "integration_id": PaymentKeys.payMopIntegrationId,
      "billing_data": billingData.toMap(),
    });

    return paymentKeyTokenResponse.token;
  }
}
