import 'package:book_mart/core/widgets/show_bar.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartBlocListener extends StatelessWidget {
  const AddToCartBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddToCartSuccess) {
          showBar(context, 'Added to Cart Successfully');
        }
        if (state is AddToCartFailure) {
          showBar(context, state.apiErrorModel.getAllErrorsMessages());
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}