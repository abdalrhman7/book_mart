import 'package:book_mart/features/checkout/ui/widgets/step_item.dart';
import 'package:flutter/material.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentPageIndex, required this.pageController, required this.onTap});

  final int currentPageIndex;
  final PageController pageController;
  final ValueChanged<int> onTap;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        getSteps().length,
        (index) {
          return Expanded(
              child: GestureDetector(
            onTap: () {
              onTap(index);
            },
            child: StepItem(
              isActive: index <= currentPageIndex,
              text: getSteps()[index],
              index: '${index + 1}',
            ),
          ));
        },
      ),
    );
  }
}

List<String> getSteps() {
  return ['shipping', 'address', 'payment'];
}
