import 'package:book_mart/features/checkout/ui/widgets/payment_section/payment_section.dart';
import 'package:book_mart/features/checkout/ui/widgets/shipping_widgets/shipping_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'address_widgets/address_input_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.valueListenable,
  });

  final PageController pageController;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return getPages()[index];
        },
        itemCount: getPages().length,
      ),
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      AddressInputSection(
        valueListenable: valueListenable,
      ),
      PaymentSection(pageController: pageController),
    ];
  }
}
