import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';

class PriceWithDiscount extends StatelessWidget {
  const PriceWithDiscount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '300',
                style: TextStyles.font14BlackMedium.copyWith(
                  decoration: TextDecoration.lineThrough,
                  color: ColorsManager.gray,
                ),
              ),
              const WidgetSpan(
                child: SizedBox(width: 4),
              ),
              TextSpan(
                text: '150',
                style: TextStyles.font14BlackMedium,
              ),
            ],
          ),
        ),
        horizontalSpace(8),
        Text(
          '50% Off',
          style: TextStyles.font14BlackSemiBold.copyWith(
            color: ColorsManager.mainBinkColor,
          ),
        ),
      ],
    );
  }
}
