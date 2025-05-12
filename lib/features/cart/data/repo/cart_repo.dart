import 'package:book_mart/core/netwoking/api_error_handler.dart';
import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/features/cart/data/model/cart_model.dart';
import 'package:book_mart/features/cart/data/model/update_cart_model.dart';
import 'package:book_mart/features/cart/data/networking/cart_api_services.dart';

class CartRepo {
  final CartApiServices cartApiService;

  CartRepo(this.cartApiService);

  Future<ApiResult<CartData>> addToCart(int bookId) async {
    try {
      var result = await cartApiService.addToCart(
        {'product_id': bookId},
      );
      return ApiResult.success(result.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CartData>> getCart() async {
    try {
      var result = await cartApiService.getCart();
      return ApiResult.success(result.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CartData>> removeFromCart(int itemId) async {
    try {
      var result = await cartApiService.removeItemFromCart(
        {'cart_item_id': itemId},
      );
      return  ApiResult.success(result.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<CartData>> updateCart(UpdateCartModel updateCartModel) async {
    try {
      var result = await cartApiService.updateCart(updateCartModel);
      return ApiResult.success(result.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
