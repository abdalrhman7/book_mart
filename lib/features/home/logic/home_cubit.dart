import 'package:bloc/bloc.dart';
import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/features/home/data/models/categories_model.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:book_mart/features/home/data/models/slider_images_model.dart';
import 'package:book_mart/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo ;

  Future<void> initializeHome() async {
    await Future.wait([
      getCategories(),
      getBestSellers(),
      getNewArrivals(),
      getSliderImages(),
    ]);
  }


  Future<void> getCategories()async{
    emit(GetCategoriesLoading());
    final result = await homeRepo.getCategories();
    result.when(success: (data) {
      emit(GetCategoriesSuccess(data));
    }, failure: (error) {
      emit(GetCategoriesFailure(error));
    });
  }

  Future<void> getBestSellers()async{
    emit(GetBestSellersLoading());
    final result = await homeRepo.getBestSellerProducts();
    result.when(success: (data) {
      emit(GetBestSellersSuccess(data));
    }, failure: (error) {
      emit(GetBestSellersFailure(error));
    });
  }

  Future<void> getNewArrivals()async{
    emit(GetNewArrivalsLoading());
    final result = await homeRepo.getNewArrivalsProduct();
    result.when(success: (data) {
      emit(GetNewArrivalsSuccess(data));
    }, failure: (error) {
      emit(GetNewArrivalsFailure(error));
    });
  }

  Future<void> getSliderImages()async{
    emit(GetSliderImageLoading());
    final result = await homeRepo.getSliderImages();
    result.when(success: (data) {
      emit(GetSliderImageSuccess(data));
    }, failure: (error) {
      emit(GetSliderImageFailure(error));
    });
  }
}
