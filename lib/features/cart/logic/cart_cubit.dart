import 'package:bloc/bloc.dart';
import 'package:book_mart/core/netwoking/api_error_model.dart'
    show ApiErrorModel;
import 'package:book_mart/features/cart/data/model/cart_model.dart';
import 'package:book_mart/features/cart/data/model/update_cart_model.dart';
import 'package:book_mart/features/cart/data/repo/cart_repo.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());

  String totalPrice = '';
  final CartRepo cartRepo;
  bool isDiscountApplied = false;
  int cartItemCount = 0;

  Future<void> addToCart(int bookId) async {
    emit(AddToCartLoading());
    var result = await cartRepo.addToCart(bookId);
    result.when(
      success: (data) {
        updateCartItemCount(data.cartItems);
        emit(AddToCartSuccess());
      },
      failure: (error) => emit(AddToCartFailure(error)),
    );
  }


  Future<void> getCart() async {
    clearCart();
    emit(GetCartLoading());
    final result = await cartRepo.getCart();
    result.when(success: (data) {
      if (data.cartItems.isEmpty) {
        emit(EmptyCart());
      } else {
        totalPrice = data.cartTotalPriceAsString;
        updateCartItemCount(data.cartItems);
        emit(GetCartSuccess(data));
      }
      if (isDiscountApplied) {
        isDiscountApplied = false;
        applyCoupon();
      }
    }, failure: (error) {
      emit(GetCartFailure(error));
    });
  }

  Future<void> removeItem(int itemId) async {
    emit(RemoveItemFromCartLoading(itemId));
    final result = await cartRepo.removeFromCart(itemId);
    result.when(success: (data) {
      if (data.cartItems.isEmpty) {
        cartItemCount = 0;
        emit(EmptyCart());
      } else {
        totalPrice = data.cartTotalPriceAsString;
        updateCartItemCount(data.cartItems);
        emit(RemoveItemFromCartSuccess(data));
      }
      if (isDiscountApplied) {
        isDiscountApplied = false;
        applyCoupon();
      }
    }, failure: (error) {
      emit(RemoveItemFromCartFailure(error));
    });
  }

  Future<void> updateCart(UpdateCartModel updateCartModel) async {
    emit(UpdateCartLoading(updateCartModel.cartItemId));
    final result = await cartRepo.updateCart(updateCartModel);
    result.when(success: (data) {
      totalPrice = data.cartTotalPriceAsString;
      updateCartItemCount(data.cartItems);
      emit(UpdateCartSuccess(data));
      // check if coupon is applied
      if (isDiscountApplied) {
        isDiscountApplied = false;
        applyCoupon();
      }
    }, failure: (error) {
      emit(UpdateCartFailure(error));
    });
  }

  void applyCoupon() {
    if (isDiscountApplied) return;
    double price = double.tryParse(totalPrice) ?? 0.0;
    double discountedPrice = price * 0.90;
    String formattedPrice =
        discountedPrice.truncateToDouble() == discountedPrice
            ? discountedPrice.toStringAsFixed(0)
            : discountedPrice.toStringAsFixed(2);

    totalPrice = formattedPrice;
    isDiscountApplied = true;
    emit(ApplyCouponSuccess(totalPrice));
  }

  void updateCartItemCount(List<CartItem> items) {
    cartItemCount = 0;
    items.forEach((e) => cartItemCount += e.quantity);
  }

  void clearCart() {
    cartItemCount = 0;
    isDiscountApplied = false;
    totalPrice = '';
  }

}
