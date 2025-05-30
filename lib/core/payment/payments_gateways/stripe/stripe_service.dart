import 'dart:async';

import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/core/netwoking/payment_api_services/stripe_api_service/stripe_api_service.dart';
import 'package:book_mart/core/payment/model/ephemeral_key.dart';
import 'package:book_mart/core/payment/model/ini_payment_sheet_input_model.dart';
import 'package:book_mart/core/payment/model/stribe_payment_intent_input_model.dart';
import 'package:book_mart/core/payment/model/stripe_payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final StripeApiService stripeApiService;

  StripeService(this.stripeApiService);

  // Create Payment Intent
  Future<StripePaymentIntentModel> createPaymentIntent(
      StripePaymentIntentInputModel paymentIntentInputModel) async {
    print(
        'paymentIntentInputModel.toJson()${paymentIntentInputModel.toJson()}');
    var response = await stripeApiService
        .createPaymentIntent(paymentIntentInputModel.toJson());
    return response;
  }

  // Create Ephemeral Key
  Future<EphemeralKey> createEphemeralKey(String customerId) async {
    var response =
        await stripeApiService.createEphemeralKey({'customer': customerId});
    return response;
  }

  // Initialize Payment Sheet
  Future initPaymentSheet(
      {required InitPaymentSheetInputModel inputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: inputModel.clientSecret,
        customerId: inputModel.customerId,
        customerEphemeralKeySecret: inputModel.ephemeralKeySecret,
        merchantDisplayName: 'Your Merchant Name',
      ),
    );
  }

  // Display Payment Sheet
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // Make Payment
  Future<ApiResult> makePayment(
      {required StripePaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      var paymentIntentModel =
          await createPaymentIntent(paymentIntentInputModel);

      var ephemeralKeyModel =
          await createEphemeralKey(paymentIntentInputModel.customerId);

      var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentModel.customer!,
        ephemeralKeySecret: ephemeralKeyModel.secret!,
      );
      await initPaymentSheet(inputModel: initPaymentSheetInputModel);

      await displayPaymentSheet();

      return const ApiResult.success(true);
    } catch (e) {
      print("Error during payment process: $e");
      return ApiResult.failure(ApiErrorModel(message: e.toString()));
    }
  }

}
