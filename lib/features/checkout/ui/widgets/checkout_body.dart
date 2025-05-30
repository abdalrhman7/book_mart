import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/features/checkout/logic/checkout_cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkout_steps.dart';
import 'checkout_steps_page_view.dart';

class CheckoutBody extends StatefulWidget {
  const CheckoutBody({super.key});

  @override
  State<CheckoutBody> createState() => _CheckoutBodyState();
}

class _CheckoutBodyState extends State<CheckoutBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var cubit = context.read<CheckoutCubit>();
    cubit.pageController = PageController();
    cubit.pageController.addListener(() {
      setState(() {
        cubit.currentPageIndex = cubit.pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CheckoutCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          verticalSpace(20),
          CheckoutSteps(
            currentPageIndex: cubit.currentPageIndex,
            pageController: cubit.pageController,
            onTap: (index) {
              final curr = cubit.currentPageIndex;
              if (index < curr) {
                _animateToStep(index);
                return;
              }
              if (curr == 0 && index == 1 && cubit.isCashPayment != null) {
                _animateToStep(index);
                return;
              }
              if (curr == 1 &&
                  index == 2 &&
                  cubit.checkoutFormKey.currentState!.validate()) {
                _animateToStep(index);
                return;
              }
            },
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: cubit.pageController,
              valueListenable: cubit.autoValidateModeNotifier,
            ),
          )
        ],
      ),
    );
  }

  void _animateToStep(int page) {
    context.read<CheckoutCubit>().pageController.animateToPage(
          page,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
  }

  @override
  void dispose() {
    var cubit = context.read<CheckoutCubit>();
    cubit.pageController.dispose();
    context.read<CheckoutCubit>().autoValidateModeNotifier.dispose();
    super.dispose();
  }
}
