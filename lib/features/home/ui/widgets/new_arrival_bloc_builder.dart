import 'package:book_mart/core/widgets/shimmer/product_shimmer_effect.dart';
import 'package:book_mart/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_horizontal_list.dart' ;



class NewArrivalBlocBuilder extends StatelessWidget {
  const NewArrivalBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is GetNewArrivalsLoading || current is GetNewArrivalsSuccess || current is GetNewArrivalsFailure,
      builder: (context, state) {
        if (state is GetNewArrivalsLoading) {
          return const ProductShimmerEffect();
        } else if (state is GetNewArrivalsSuccess) {
          return  BookHorizontalList(books: state.productData.products,);
        } else if (state is GetNewArrivalsFailure) {
          return Text(state.apiErrorModel.getAllErrorsMessages());
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}