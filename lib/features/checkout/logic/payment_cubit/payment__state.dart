part of 'payment__cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PreparePaymobPaymentLoading extends PaymentState {}

final class PreparePaymobPaymentSuccess extends PaymentState {
  final String paymentKeyToken;

  PreparePaymobPaymentSuccess(this.paymentKeyToken);
}

final class PreparePaymobPaymentFailure extends PaymentState {
  final ApiErrorModel apiErrorModel;

  PreparePaymobPaymentFailure(this.apiErrorModel);
}

final class PlaceOrderLoading extends PaymentState {}

final class PlaceOrderSuccess extends PaymentState {}

final class PlaceOrderFailure extends PaymentState {}

final class PrepareStripePaymentLoading extends PaymentState {}

final class StripePaymentSuccess extends PaymentState {}

final class StripePaymentFailure extends PaymentState {}
