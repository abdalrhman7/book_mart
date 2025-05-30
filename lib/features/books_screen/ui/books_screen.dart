import 'package:book_mart/core/di/dependency_injection.dart';
import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/features/books_screen/data/repo/filtered_books_repo.dart';
import 'package:book_mart/features/books_screen/logic/books_cubit.dart';
import 'package:book_mart/features/books_screen/ui/widgets/books_grid_view_bloc_builder.dart';
import 'package:book_mart/features/books_screen/ui/widgets/load_more_books_indicator_bloc_builder.dart';
import 'package:book_mart/features/books_screen/ui/widgets/sort_and_filter_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: BlocProvider<BooksCubit>(
        create: (context) =>
            BooksCubit(getIt<FilteredBooksRepo>())..getInitialBooks(),
        child: const BooksBody(),
      ),
    );
  }
}

class BooksBody extends StatelessWidget {
  const BooksBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 18, end: 8),
        child: Column(
          children: [
            verticalSpace(8),
            const SortAndFilterBar(),
            verticalSpace(8),
            const BooksGridViewBlocBuilder(),
            const LoadMoreBooksIndicatorBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
