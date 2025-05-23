part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoadingState extends ProductDetailsState {}

final class ProductDetailsLoadedState extends ProductDetailsState {
  final BookModel bookModel;

  ProductDetailsLoadedState({required this.bookModel});
}

final class ProductDetailsErrorState extends ProductDetailsState {
  final ApiErrorModel apiErrorModel;

  ProductDetailsErrorState({required this.apiErrorModel});
}
