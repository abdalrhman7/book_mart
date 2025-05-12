import 'package:book_mart/core/netwoking/api_constants.dart';
import 'package:book_mart/features/cart/data/model/cart_model.dart';
import 'package:book_mart/features/cart/data/model/update_cart_model.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:book_mart/features/product_details_screen/data/model/product_details_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'product_details_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProductDetailsApiService{
  factory ProductDetailsApiService(Dio dio) = _ProductDetailsApiService;

  @GET(ApiConstants.productById)
  Future<ProductDetailsModel> getProductById(@Path("id") int id);
}