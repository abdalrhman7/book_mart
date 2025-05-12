part of 'books_cubit.dart';

@immutable
sealed class BooksState {}

final class BooksInitial extends BooksState {}

final class BooksInitialLoading extends BooksState {}


final class BooksLoadSuccess extends BooksState {
  final List<BookModel> books;

  BooksLoadSuccess(this.books);
}

final class BooksLoadFailure extends BooksState {
  final ApiErrorModel apiErrorModel;

  BooksLoadFailure(this.apiErrorModel);
}

final class BooksFilterSuccess extends BooksState {
  final List<BookModel> filteredBooks;
  BooksFilterSuccess(this.filteredBooks);
}


final class LoadingNextPageBooks extends BooksState {}

