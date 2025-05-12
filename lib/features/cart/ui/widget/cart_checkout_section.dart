import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:book_mart/features/checkout/ui/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class CartCheckoutSection extends StatelessWidget {
  const CartCheckoutSection({
    super.key,
    required this.totalPrice,
  });

  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.lighterGray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          )),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Text(totalPrice, style: TextStyles.font16BlackSemiBold),
          horizontalSpace(22),
          Expanded(
            child: AppTextButton(
              buttonText: 'Proceed to Payment',
              onPressed: () {
                pushScreen(
                  context,
                  screen: CheckoutScreen(
                    isDiscountApplied:
                        context.read<CartCubit>().isDiscountApplied,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
