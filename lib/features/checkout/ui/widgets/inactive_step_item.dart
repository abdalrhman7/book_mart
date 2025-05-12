import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key, required this.index, required this.text , });

  final String index;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         CircleAvatar(
          backgroundColor: const Color(0xFFF2F3F3),
          radius: 10,
          child: Text(index, style: TextStyles.font14BlackSemiBold),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyles.font14BlackSemiBold.copyWith(color: const Color(0xFFAAAAAA)),
        ),
      ],
    );
  }
}
