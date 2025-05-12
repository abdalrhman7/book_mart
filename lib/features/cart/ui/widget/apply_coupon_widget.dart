import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplyCouponWidget extends StatelessWidget {
  const ApplyCouponWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          SvgPicture.asset('assets/images/coupon_icon.svg'),
          horizontalSpace(12),
          Text(
            'Apply 10% Off',
            style: TextStyles.font16BlackMedium,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              print(context.read<CartCubit>().isDiscountApplied);
              context.read<CartCubit>().applyCoupon();
            },
            child: BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) => current is ApplyCouponSuccess,
              builder: (context, state) {
                if (state is ApplyCouponSuccess) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Colors.green.shade500, width: 2),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.green.shade500,
                    ),
                  );
                }
                return Text(
                  'Apply',
                  style: TextStyles.font16BlackMedium
                      .copyWith(color: ColorsManager.mainBinkColor),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
