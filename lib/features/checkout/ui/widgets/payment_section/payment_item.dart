import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(title, style: TextStyles.font16BlackSemiBold),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color:  Colors.grey.shade200,
          ),
          child: child,
        )
      ],
    );
  }
}
