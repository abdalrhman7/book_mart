import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:book_mart/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToCartBlocBuilderButton extends StatelessWidget {
  const AddToCartBlocBuilderButton({
    super.key,
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is AddToCartLoading ||
          current is AddToCartSuccess ||
          current is AddToCartFailure,
      builder: (context, state) {
        return Center(
            child: AppTextButton(
          buttonText: 'Add to Cart',
          onPressed: () {
            context.read<CartCubit>().addToCart(book.id);
          },
          buttonWidth: .45.sw,
          textStyle: TextStyles.font18WhiteSemiBold,
          isLoading: state is AddToCartLoading,
        ));
      },
    );
  }
}
