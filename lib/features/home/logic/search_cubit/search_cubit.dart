import 'package:bloc/bloc.dart';
import 'package:book_mart/core/netwoking/api_error_model.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:book_mart/features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  final HomeRepo homeRepo;

  List<BookModel> searchedBooks = [];

  Future<void> search(String query) async {
    emit(SearchLoading());
    final result = await homeRepo.searchBooks(query);
    result.when(
      success: (data) {
        searchedBooks = data.products;
        emit(SearchSuccess(data));
      },
      failure: (error) {
        emit(SearchFailure(error));
      },
    );
  }

  void clearSearch(){
    searchedBooks = [] ;
    emit(SearchInitial());
  }

}
