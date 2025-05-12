import 'package:book_mart/features/books_screen/logic/books_cubit.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:book_mart/features/home/ui/widgets/book_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksGridView extends StatefulWidget {
  const BooksGridView({
    super.key,
    required this.books,
  });

  final List<BookModel> books;

  @override
  _BooksGridViewState createState() => _BooksGridViewState();
}

class _BooksGridViewState extends State<BooksGridView> {
  late ScrollController _scrollController;
  late BooksCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<BooksCubit>(context);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent && cubit.enablePagination) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    cubit.loadMoreBooks();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.books.length,
        padding: const EdgeInsets.only(bottom: 6),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 8,
          childAspectRatio: 0.62,
        ),
        itemBuilder: (context, index) {
          return BookItemCard(book: widget.books[index]);
        },
      ),
    );
  }
}