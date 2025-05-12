import 'package:book_mart/core/payment/model/ephemeral_key.dart';
import 'package:book_mart/core/payment/model/stripe_payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'stripe_api_service.g.dart';

@RestApi(baseUrl: 'https://api.stripe.com/v1/')
abstract class StripeApiService {
  factory StripeApiService(Dio dio) = _StripeApiService;

  // Create Payment Intent
  @POST('payment_intents')
  Future<StripePaymentIntentModel> createPaymentIntent(
      @Body() Map<String, dynamic> body,
      );

  // Create Ephemeral Key
  @POST('ephemeral_keys')
  Future<EphemeralKey> createEphemeralKey(
      @Body() Map<String, dynamic> body,
      );
}
