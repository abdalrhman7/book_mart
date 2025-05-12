import 'package:book_mart/core/netwoking/api_error_handler.dart';
import 'package:book_mart/core/netwoking/api_result.dart';
import 'package:book_mart/features/home/data/models/categories_model.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:book_mart/features/home/data/models/slider_images_model.dart';
import 'package:book_mart/features/home/data/networking/home_api_service.dart';

class HomeRepo{
  final HomeApiService homeApiService ;
  HomeRepo( this.homeApiService);

  Future<ApiResult<CategoriesData>> getCategories()async{
    try {
      final result = await homeApiService.getCategories();
      return  ApiResult.success(result.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProductData>> getBestSellerProducts()async{
    try {
      final result = await homeApiService.getBestSellerProducts();
      return  ApiResult.success(result.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProductData>> getNewArrivalsProduct()async{
    try {
      final result = await homeApiService.getNewArrivalsProduct();
      return  ApiResult.success(result.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<SliderImagesData>> getSliderImages()async{
    try {
      final result = await homeApiService.getSliderImages();
      return  ApiResult.success(result.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<ProductData>> searchBooks(String query)async{
    try {
      final result = await homeApiService.searchBooks(query);
      return  ApiResult.success(result.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }



}