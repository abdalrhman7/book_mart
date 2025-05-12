import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/core/widgets/sliver_divider.dart';
import 'package:book_mart/features/cart/data/model/cart_model.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'apply_coupon_widget.dart';
import 'cart_item_widgets/cart_items_sliver_list.dart';
import 'cart_item_widgets/order_payment_details_widget.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key, required this.cartData});

  final CartData cartData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          CartItemsSliverList(cartData: cartData),
          sliverVerticalSpace(30),
          const ApplyCouponWidget(),
          const SliverDivider(height: 60),
          OrderPaymentDetailsWidget(
              totalPrice: cartData.cartTotalPriceAsString),
          const SliverDivider(height: 60),
          SliverToBoxAdapter(
            child: Row(
              children: [
                Text('Order Total', style: TextStyles.font16BlackRegular),
                const Spacer(),
                BlocBuilder<CartCubit, CartState>(
                  buildWhen: (previous, current) =>
                      current is ApplyCouponSuccess || current is RemoveItemFromCartSuccess,
                  builder: (context, state) {
                    if (state is ApplyCouponSuccess) {
                      return Text(state.totalPriceAfterDiscount,
                          style: TextStyles.font16BlackSemiBold);
                    }
                    return Text(
                      cartData.cartTotalPriceAsString,
                      style: TextStyles.font16BlackSemiBold,
                    );
                  },
                ),
              ],
            ),
          ),
          sliverVerticalSpace(30),
        ],
      ),
    );
  }
}
