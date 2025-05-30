part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final ProductData productsData;
  SearchSuccess(this.productsData);
}

final class SearchFailure extends SearchState {
  final ApiErrorModel apiErrorModel;
  SearchFailure(this.apiErrorModel);
}
