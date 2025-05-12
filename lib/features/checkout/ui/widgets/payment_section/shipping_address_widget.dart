import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/features/checkout/logic/checkout_cubit/checkout_cubit.dart';
import 'package:book_mart/features/checkout/ui/widgets/payment_section/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'Delivery address',
      child:Row(
        children: [
          GestureDetector(
            onTap: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.edit,
                  size: 18,
                ),
                horizontalSpace(8),
                Text(
                  'Edit',
                  style: TextStyles.font14BlackSemiBold,
                ),
              ],
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Text(
              ' ${context.read<CheckoutCubit>().addressController.text}',
              textAlign: TextAlign.left,
              style: TextStyles.font14BlackSemiBold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(
            Icons.edit_location_alt_rounded,
            size: 18,
          ),
        ],
      )

    );
  }
}
