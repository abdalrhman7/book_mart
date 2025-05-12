import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';


class FilterButton  extends StatelessWidget {
  final String label;
  final Icon icon;
  final void Function()? onTap;


  const FilterButton({
    super.key,
    required this.label,
    required this.icon, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: .5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyles.font12BlackMedium,
              ),
              horizontalSpace(6),
              icon,
            ],
          ),
        ),
      ),
    );
  }
}