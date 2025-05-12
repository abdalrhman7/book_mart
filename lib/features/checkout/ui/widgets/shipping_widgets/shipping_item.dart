import 'package:book_mart/core/theming/colors.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.price,
    required this.subtitle,
    required this.isSelected, required this.onTap,
  });

  final String title, subtitle, price;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
            side:  BorderSide(color: isSelected ? ColorsManager.mainBinkColor : Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            isSelected ? const ActiveShippingItemDot() :  const InActiveShippingItemDot(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyles.font14BlackSemiBold),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyles.font14BlackSemiBold
                        .copyWith(color: Colors.black.withOpacity(0.5)),
                  ),
                ],
              ),
              const Spacer(),
              Center(
                child: Text(
                  price,
                  style: TextStyles.font14BlackSemiBold
                      .copyWith(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const ShapeDecoration(
        color: ColorsManager.mainBinkColor,
        shape: OvalBorder(
          side: BorderSide(color: Colors.white, width: 4),
        ),

      ),
    );
  }
}

class InActiveShippingItemDot extends StatelessWidget {
  const InActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      padding: const EdgeInsets.all(4),
      decoration: const ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(color: Color(0xFF949D9E), width: 1),
        ),
      ),
    );
  }
}
