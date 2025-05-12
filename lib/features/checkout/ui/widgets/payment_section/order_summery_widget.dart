import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/features/checkout/logic/checkout_cubit/checkout_cubit.dart';
import 'package:book_mart/features/checkout/ui/widgets/payment_method_list_view.dart';
import 'package:book_mart/features/checkout/ui/widgets/payment_section/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CheckoutCubit>();
    return PaymentItem(
      title: 'order summary',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         if (cubit.isDiscountApplied)
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Price Before Discount :',
                    style: TextStyles.font14BlackSemiBold,
                  ),
                  const Spacer(),
                  Text(
                    cubit.priceBeforeDiscount,
                    style: TextStyles.font16BlackSemiBold,
                  ),
                ],
              ),
              verticalSpace(8),
            ],
          ),
          Row(
            children: [
              Text(
                cubit.isDiscountApplied ? 'Price After Discount : ' : 'Subtotal :',
                style: TextStyles.font14BlackSemiBold,
              ),
              const Spacer(),
              Text(
                cubit.subTotal,
                style: TextStyles.font16BlackSemiBold,
              ),
            ],
          ),
          verticalSpace(8),
          Row(
            children: [
              Text(
                'shipping :',
                style: TextStyles.font14BlackSemiBold,
              ),
              const Spacer(),
              Text(
                cubit.isCashPayment! ? '30' : 'free',
                style: TextStyles.font14BlackSemiBold,
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(
            thickness: 0.5,
            color: Color(0xFFCACECE),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'total :',
                style: TextStyles.font16BlackSemiBold,
              ),
              const Spacer(),
              Text(
                cubit.getTotal(),
                style: TextStyles.font16BlackSemiBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
