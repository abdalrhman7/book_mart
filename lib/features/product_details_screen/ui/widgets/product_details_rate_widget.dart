import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';


class ProductDetailsRateWidget extends StatelessWidget {
  const ProductDetailsRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(5, (index) {
          return const Icon(
            Icons.star, color: ColorsManager.yellow, size: 19,);
        },),
        horizontalSpace(8),
        Text('56,890', style: TextStyles.font14GrayMedium,)
      ],
    );
  }
}