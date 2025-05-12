import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

import 'book_item_card.dart';


class BookHorizontalList extends StatelessWidget {

  final List<BookModel> books;

  const BookHorizontalList({
    super.key, required this.books,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              books.length,
                  (index) {
                return BookItemCard(book: books[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}