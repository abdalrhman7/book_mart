import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/features/books_screen/logic/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoadMoreBooksIndicatorBlocBuilder extends StatelessWidget {
  const LoadMoreBooksIndicatorBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksCubit, BooksState>(
      buildWhen: (previous, current) => current is LoadingNextPageBooks || current is BooksLoadSuccess,
      builder: (context, state) {
        if(state is LoadingNextPageBooks){
          return  Column(
            children: [
              verticalSpace(12),
              const Center(child: CircularProgressIndicator(),),
              verticalSpace(12),
            ],
          );
        }else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}