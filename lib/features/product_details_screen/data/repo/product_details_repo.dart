import 'package:book_mart/core/netwoking/api_error_handler.dart';
import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:book_mart/features/product_details_screen/data/networking/product_details_api_service.dart';

class ProductDetailsRepo {
  final ProductDetailsApiService productDetailsApiService;
  ProductDetailsRepo(this.productDetailsApiService);

  Future<ApiResult<BookModel>> getProductById(int id) async {
    try {
      var result = await productDetailsApiService.getProductById(id);
      print('result: $result');
      return ApiResult.success(result.data);
    } catch (e) {
      print('error: $e');
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}