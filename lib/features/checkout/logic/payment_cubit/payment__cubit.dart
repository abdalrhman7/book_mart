import 'package:bloc/bloc.dart';
import 'package:book_mart/core/constants/payment_keys.dart';
import 'package:book_mart/core/di/dependency_injection.dart';
import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/core/netwoking/payment_api_services/paymob_api_services/paymob_api_service.dart';
import 'package:book_mart/core/netwoking/payment_api_services/stripe_api_service/stripe_api_service.dart';
import 'package:book_mart/core/payment/model/payment_input_model.dart';
import 'package:book_mart/core/payment/model/stribe_payment_intent_input_model.dart';
import 'package:book_mart/core/payment/payments_gateways/paymob/paymop_service.dart';
import 'package:book_mart/core/payment/payments_gateways/stripe/stripe_service.dart';
import 'package:book_mart/features/checkout/date/model/place_order_request_body.dart';
import 'package:book_mart/features/checkout/date/repo/checkout_repo.dart';
import 'package:book_mart/features/checkout/logic/checkout_cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:multi_payment_gateway/services/paypal_service.dart';
import 'package:multi_payment_gateway/transaction.dart';
part 'payment__state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final CheckoutRepo checkoutRepo;
  final CheckoutCubit checkoutCubit;

  PaymentCubit({required this.checkoutRepo, required this.checkoutCubit})
      : super(PaymentInitial());

  Future<void> payUsingPaymob() async {
    emit(PreparePaymobPaymentLoading());

    PaymobPaymentInputModel input = PaymobPaymentInputModel(
      amount: (double.parse(checkoutCubit.getTotal())).toInt(),
      email: checkoutCubit.emailController.text,
      firstName: checkoutCubit.nameController.text,
      lastName: checkoutCubit.nameController.text,
      phone: checkoutCubit.phoneController.text,
    );

    final payMopService =
        PayMopService(await getIt.getAsync<PaymobApiService>());
    final result = await payMopService.makePayment(input);

    result.when(
      success: (paymentKeyToken) =>
          emit(PreparePaymobPaymentSuccess(paymentKeyToken)),
      failure: (apiErrorModel) =>
          emit(PreparePaymobPaymentFailure(apiErrorModel)),
    );
  }

  Future<void> payUsingStripe() async {
    emit(PrepareStripePaymentLoading());
    StripePaymentIntentInputModel paymentIntentInputModel =
    StripePaymentIntentInputModel(
      amount: (double.parse(checkoutCubit.getTotal())),
      currency: 'usd',
      customerId: 'cus_OvTlnS3BNlO7eF',
    );

    final stripeService =
    StripeService(await getIt.getAsync<StripeApiService>());
    final result = await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    result.when(
      success: (paymentKeyToken) => emit(StripePaymentSuccess()),
      failure: (apiErrorModel) => emit(StripePaymentFailure()),
    );
  }

  Future<void> placeOrder() async {
    emit(PlaceOrderLoading());
    PlaceOrderRequestBody placeOrderRequestBody = PlaceOrderRequestBody(
      address: checkoutCubit.addressController.text,
      email: checkoutCubit.emailController.text,
      name: checkoutCubit.nameController.text,
      phone: checkoutCubit.phoneController.text,
      governorateId: '1',
    );
    var result = await checkoutRepo.placeOrder(placeOrderRequestBody);
    result.when(success: (data) {
      emit(PlaceOrderSuccess());
    }, failure: (error) {
      emit(PlaceOrderFailure());
    });
  }

  Future<void> payUsingPaypal(BuildContext context) async {
    final paypalModel = SetupePaypalPayment(
      context: context,
      clientId: PaymentKeys.paypalClientId,
      secretKey: PaymentKeys.paypalSecretKey,
      transactions: [checkoutCubit.buildPaypalTransaction()],
      onSuccess: (params) async{
        await placeOrder();
      },
    );
    await PaypalService.instance.pay(setupPayment: paypalModel);
  }
}
