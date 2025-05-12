import 'package:book_mart/core/netwoking/api_constants.dart';
import 'package:book_mart/features/home/data/models/categories_model.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'filtered_books_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class FilteredBooksApiService{
  factory FilteredBooksApiService(Dio dio) = _FilteredBooksApiService;

  @GET(ApiConstants.products)
  Future<ProductModel> getAllProducts();

  @GET(ApiConstants.productsFilter)
  Future<ProductModel> filterProducts(
      @Queries() Map<String, dynamic> queryParams,
      );




}