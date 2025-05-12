part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class AddToCartLoading extends CartState {}

final class AddToCartSuccess extends CartState {}

final class AddToCartFailure extends CartState {
  final ApiErrorModel apiErrorModel ;
  AddToCartFailure(this.apiErrorModel);
}

final class GetCartLoading extends CartState {}

final class GetCartSuccess extends CartState {
 final CartData cartData ;

  GetCartSuccess(this.cartData);
}

final class GetCartFailure extends CartState {
  final ApiErrorModel apiErrorModel ;
  GetCartFailure(this.apiErrorModel);
}

final class EmptyCart extends CartState {}


final class RemoveItemFromCartLoading extends CartState {
  final int itemId ;
  RemoveItemFromCartLoading(this.itemId);
}

final class RemoveItemFromCartSuccess extends CartState {
  final CartData cartData ;

  RemoveItemFromCartSuccess(this.cartData);
}

final class RemoveItemFromCartFailure extends CartState {
  final ApiErrorModel apiErrorModel ;
  RemoveItemFromCartFailure(this.apiErrorModel);
}


final class ApplyCouponSuccess extends CartState {
  final String totalPriceAfterDiscount ;

  ApplyCouponSuccess(this.totalPriceAfterDiscount);
}


final class UpdateCartLoading extends CartState {
  final int itemId ;
  UpdateCartLoading(this.itemId);
}

final class UpdateCartSuccess extends CartState {
  final CartData cartData ;
  UpdateCartSuccess(this.cartData);
}

final class UpdateCartFailure extends CartState {
  final ApiErrorModel apiErrorModel ;
  UpdateCartFailure(this.apiErrorModel);
}