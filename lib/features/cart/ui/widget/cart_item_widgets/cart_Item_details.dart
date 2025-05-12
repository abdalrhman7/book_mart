import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/features/cart/data/model/cart_model.dart';
import 'package:flutter/material.dart';



class CartItemDetails extends StatelessWidget {
  const CartItemDetails({super.key,required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cartItem.name,
          style: TextStyles.font16BlackSemiBold,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(8),
        Text(
          '${cartItem.stock} in stock',
          style: TextStyles.font14BlackSemiBold,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(8),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: cartItem.priceAfterDiscount.toString(),
                  style: TextStyles.font16BlackSemiBold),
              const WidgetSpan(child: SizedBox(width: 6)),
              TextSpan(
                text: cartItem.price,
                style: TextStyles.font14BlackMedium.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: ColorsManager.gray,
                ),
              ),
              const WidgetSpan(
                child: SizedBox(width: 4),
              ),
              TextSpan(
                text: '${cartItem.discount}%',
                style: TextStyles.font12DarkBlackMedium
                    .copyWith(
                    color: ColorsManager.mainBinkColor),
              ),
            ],
          ),
        ),
        verticalSpace(8),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Get it',
                style: TextStyles.font14BlackSemiBold,
              ),
              const WidgetSpan(child: SizedBox(width: 6)),
              TextSpan(
                text: 'Tomorrow',
                style: TextStyles.font14BlackSemiBold.copyWith(
                  color: Colors.green.shade500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



