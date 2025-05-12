import 'dart:math' as math;

import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/core/widgets/app_text_form_faild.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:book_mart/features/home/logic/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class BooksSearchBar extends StatefulWidget {
  const BooksSearchBar({super.key});

  @override
  State<BooksSearchBar> createState() => _BooksSearchBarState();
}

class _BooksSearchBarState extends State<BooksSearchBar> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SearchCubit>();
    return SliverToBoxAdapter(
      child: TypeAheadField<BookModel>(
        controller: _searchController,
        focusNode: _focusNode,
        suggestionsCallback: (query) async {
          if (query
              .trim()
              .isEmpty) {
            return [];
          }
          await cubit.search(query.trim());
          return cubit.searchedBooks;
        },
        itemBuilder: (context, book) {
          return Column(
            children: [
              ListTile(
                title: Text(book.name),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 4),
                trailing: GestureDetector(
                  onTap: () {
                    _searchController.text = book.name;
                    _searchController.selection = TextSelection.fromPosition(
                      TextPosition(offset: book.name.length),
                    );
                  },
                  child: Transform.rotate(
                    angle:Directionality .of(context) == TextDirection.ltr ?  math.pi / 4 :-math.pi / 4 , // tilt the arrow 45°
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
              const Divider(height: 1),
            ],
          );
        },
        onSelected: (book) {
          context.pushNamed(Routes.productDetailsScreen, arguments: book.id);
        },
        errorBuilder: (context, error) {
          return BlocBuilder<SearchCubit, SearchState>(
            buildWhen: (previous, current) => current is SearchFailure,
            builder: (context, state) {
              if (state is SearchFailure) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    state.apiErrorModel.getAllErrorsMessages(),
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          );
        },
        hideOnEmpty: true,
        debounceDuration: const Duration(milliseconds: 400),
        builder: (context, controller, focusNode) {
          return AppTextFormField(
            controller: controller,
            prefixIcon: const Icon(Icons.search),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            hintText: 'Search for books',
            focusNode: focusNode,
            suffixIcon: GestureDetector(
              onTap: controller.clear,
              child: controller.text.isNotEmpty ? const Icon(Icons.close) : const SizedBox.shrink(),
            ),
            onChanged: (_) {
              setState(() {});
            },
          );
        },

      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
