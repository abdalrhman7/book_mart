import 'package:book_mart/core/widgets/shimmer/product_shimmer_effect.dart';
import 'package:book_mart/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_horizontal_list.dart' show BookHorizontalList;

class BestSellerSectionBlocBuilder extends StatelessWidget {
  const BestSellerSectionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is GetBestSellersLoading || current is GetBestSellersSuccess || current is GetBestSellersFailure,
      builder: (context, state) {
        if (state is GetBestSellersLoading) {
          return const Center(
            child: ProductShimmerEffect(),
          );
        } else if (state is GetBestSellersSuccess) {
          return  BookHorizontalList(books: state.productData.products,);
        } else if (state is GetBestSellersFailure) {
          return Text(state.apiErrorModel.getAllErrorsMessages());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}




