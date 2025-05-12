import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: ColorsManager.mainBinkColor,
          radius: 11.5,
          child: Icon(
            Icons.check,
            size: 18,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 4),
        Text(text, style: TextStyles.font14BlackSemiBold),
      ],
    );
  }
}
