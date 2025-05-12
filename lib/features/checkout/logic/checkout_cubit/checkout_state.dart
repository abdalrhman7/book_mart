part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class PaymentMethodSelected extends CheckoutState {}

final class PlaceOrderLoading extends CheckoutState {}


final class PlaceOrderFailure extends CheckoutState {}
final class GetCartItemsLoading extends CheckoutState {}
final class GetCartItemsSuccess extends CheckoutState {}
final class GetCartItemsFailure extends CheckoutState {}