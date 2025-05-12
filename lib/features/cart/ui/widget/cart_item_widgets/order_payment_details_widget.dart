import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OrderPaymentDetailsWidget extends StatelessWidget {
  const OrderPaymentDetailsWidget({
    super.key, required this.totalPrice,
  });

  final String totalPrice;


  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Payment Details',
              style: TextStyles.font16BlackSemiBold),
          verticalSpace(20),
          Row(
            children: [
              Text('Order Amounts', style: TextStyles.font16BlackRegular),
              const Spacer(),
              Text(totalPrice, style: TextStyles.font16BlackSemiBold),
            ],
          ),
          verticalSpace(12),
          BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) => current is ApplyCouponSuccess,
            builder: (context, state) {
              if (state is ApplyCouponSuccess) {
                return Row(
                  children: [
                    Text('Discount', style: TextStyles.font16BlackRegular),
                    const Spacer(),
                    Text('10%', style: TextStyles.font16BlackSemiBold),
                  ],
                );
              }else{
                return const SizedBox.shrink();
              }
            },
          ),
          verticalSpace(12),
          Row(
            children: [
              Text('Delivery Fee', style: TextStyles.font16BlackRegular),
              const Spacer(),
              Text('Free', style: TextStyles.font16BlackSemiBold.copyWith(
                  color: ColorsManager.mainBinkColor),),
            ],
          ),
        ],
      ),
    );
  }
}

