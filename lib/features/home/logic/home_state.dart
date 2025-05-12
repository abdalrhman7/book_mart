part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetCategoriesLoading extends HomeState {}

final class GetCategoriesSuccess extends HomeState {
  final CategoriesData categoriesData;

  GetCategoriesSuccess(this.categoriesData);
}

final class GetCategoriesFailure extends HomeState {
  final ApiErrorModel apiErrorModel ;


  GetCategoriesFailure(this.apiErrorModel);
}


final class GetBestSellersLoading extends HomeState {}

final class GetBestSellersSuccess extends HomeState {
  final ProductData productData;

  GetBestSellersSuccess(this.productData);
}

final class GetBestSellersFailure extends HomeState {
  final ApiErrorModel apiErrorModel ;

  GetBestSellersFailure(this.apiErrorModel);
}

final class GetNewArrivalsLoading extends HomeState {}

final class GetNewArrivalsSuccess extends HomeState {
  final ProductData productData;

  GetNewArrivalsSuccess(this.productData);
}

final class GetNewArrivalsFailure extends HomeState {
  final ApiErrorModel apiErrorModel ;

  GetNewArrivalsFailure(this.apiErrorModel);
}


final class GetSliderImageLoading extends HomeState {}

final class GetSliderImageSuccess extends HomeState {
  final SliderImagesData sliderImagesData;

  GetSliderImageSuccess(this.sliderImagesData);
}

final class GetSliderImageFailure extends HomeState {
  final ApiErrorModel apiErrorModel ;

  GetSliderImageFailure(this.apiErrorModel);
}