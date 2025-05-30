import 'package:bloc/bloc.dart';
import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/features/books_screen/data/repo/filtered_books_repo.dart';
import 'package:book_mart/features/books_screen/data/model/book_filter.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this.filteredBooksRepo) : super(BooksInitial());

  final FilteredBooksRepo filteredBooksRepo;

  // Pagination variables
  int _currentPage = 1;
  final int _limit = 10;
  bool isLastPage = false;
  bool isLoadingMore = false;
  bool enablePagination = true;

  // Data containers
  List<BookModel> allBooks = [];
  List<BookModel> filteredBooks = [];

  // Filter state
  bool isFilterApplied = false;
  bool isBestSellersChecked = false;
  bool isPriceRangeSelected = false;
  double minPrice = 100;
  double maxPrice = 300;

  /// Fetch initial books (first page)
  Future<void> getInitialBooks() async {
    emit(BooksInitialLoading());

    _currentPage = 1;
    isLastPage = false;
    allBooks.clear();

    final result = await filteredBooksRepo.filterProducts(
      page: _currentPage,
      limit: _limit,
    );

    result.when(
      success: (data) {
        allBooks = data.products;
        isLastPage = data.products.length < _limit;
        emit(BooksLoadSuccess(allBooks));
      },
      failure: (apiErrorModel) {
        emit(BooksLoadFailure(apiErrorModel));
      },
    );
  }

  /// Load next page of books for pagination
  Future<void> loadMoreBooks() async {
    if (isLoadingMore || isLastPage) return;

    emit(LoadingNextPageBooks());
    isLoadingMore = true;
    _currentPage++;

    final result = await filteredBooksRepo.filterProducts(
      page: _currentPage,
      limit: _limit,
    );

    result.when(
      success: (data) {
        if (data.products.length < _limit) {
          isLastPage = true;
        }
        allBooks.addAll(data.products);
        emit(BooksLoadSuccess(allBooks));
      },
      failure: (apiErrorModel) {
        _currentPage--;
        emit(BooksLoadFailure(apiErrorModel));
      },
    );

    isLoadingMore = false;
  }

  /// Apply active filters (e.g., best sellers)
  Future<void> applyFilter() async {
    final filter = BookFilter(
      min: isPriceRangeSelected ? minPrice.toInt() : null,
      max: isPriceRangeSelected ? maxPrice.toInt() : null,
      isBestSeller: isBestSellersChecked ? 1 : null,
    );
    final result = await filteredBooksRepo.filterProducts(
      filter : filter,
    );

    result.when(
      success: (data) {
        enablePagination = false;
        filteredBooks = data.products;
        isFilterApplied = true;
        emit(BooksFilterSuccess(filteredBooks));
      },
      failure: (apiErrorModel) {
        emit(BooksLoadFailure(apiErrorModel));
      },
    );
  }

  /// Clear all active filters and return to full list
  void clearFilter() {
    isFilterApplied = false;
    enablePagination = true;
    isBestSellersChecked = false;
    isPriceRangeSelected = false;

    emit(BooksLoadSuccess(allBooks));
  }
}

