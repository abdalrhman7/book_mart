import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/features/checkout/ui/widgets/pay_with_paymob_bloc_listener.dart';
import 'package:book_mart/features/checkout/ui/widgets/payment_method_list_view.dart';
import 'package:book_mart/features/checkout/ui/widgets/payment_section/payment_and_place_order_bloc_listener.dart';
import 'package:book_mart/features/checkout/ui/widgets/payment_section/payment_button_bloc_builder.dart';
import 'package:book_mart/features/checkout/ui/widgets/payment_section/place_order_bloc_listener.dart';
import 'package:book_mart/features/checkout/ui/widgets/payment_section/shipping_address_widget.dart';
import 'package:flutter/material.dart';

import 'order_summery_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(12),
                const OrderSummaryWidget(),
                verticalSpace(16),
                ShippingAddressWidget(pageController: pageController),
                verticalSpace(30),
                const PaymentMethodListView(),
              ],
            ),
          ),
        ),
        const PaymentButtonBlocBuilder(),
        verticalSpace(12),
        const PayWithPaymobBlocListener(),
        const PayWithStripeBlocListener(),
        const PlaceOrderBlocListener()
      ],
    );
  }
}
