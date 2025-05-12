import 'package:book_mart/core/netwoking/api_constants.dart';
import 'package:book_mart/features/home/data/models/categories_model.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:book_mart/features/home/data/models/slider_images_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService{
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(ApiConstants.categories)
  Future<CategoriesModel> getCategories();

  @GET(ApiConstants.productsBestSeller)
  Future<ProductModel> getBestSellerProducts();

  @GET(ApiConstants.productsNewArrivals)
  Future<ProductModel> getNewArrivalsProduct();

  @GET(ApiConstants.sliders)
  Future<SliderImagesModel> getSliderImages();

  @GET(ApiConstants.productsSearch)
  Future<ProductModel> searchBooks(@Query('name') String name,);

}