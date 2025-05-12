import 'package:book_mart/features/books_screen/logic/books_cubit.dart';
import 'package:book_mart/features/books_screen/ui/widgets/books_grid_view.dart';
import 'package:book_mart/features/books_screen/ui/widgets/shimmer_books_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksGridViewBlocBuilder extends StatelessWidget {
  const BooksGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      buildWhen: (previous, current) => current is BooksInitialLoading || current is BooksLoadFailure || current is BooksLoadSuccess ||current is BooksFilterSuccess,
      builder: (context, state) {
        if (state is BooksInitialLoading) {
          return const ShimmerBooksGridView();
        } else if (state is BooksLoadFailure) {
          return Text(state.apiErrorModel.getAllErrorsMessages());
        } else if (state is BooksLoadSuccess) {
          return BooksGridView(
            books: state.books,
          );
        }else if(state is BooksFilterSuccess){
          return BooksGridView(
            books: state.filteredBooks,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}