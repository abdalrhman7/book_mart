import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/core/widgets/app_text_button.dart';
import 'package:book_mart/features/checkout/logic/checkout_cubit/checkout_cubit.dart';
import 'package:book_mart/features/checkout/logic/payment_cubit/payment__cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentButtonBlocBuilder extends StatelessWidget {
  const PaymentButtonBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var checkoutCubit = context.read<CheckoutCubit>();
    var paymentCubit = context.read<PaymentCubit>();
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (previous, current) =>
      current is PreparePaymobPaymentLoading ||
          current is PreparePaymobPaymentSuccess ||
          current is PaymentMethodSelected ||
          current is PreparePaymobPaymentLoading ,
      builder: (context, state) {
        if (state is PreparePaymobPaymentLoading ||
            state is PreparePaymobPaymentLoading
        ) {
          return const AppTextButton(
            isLoading: true,
          );
        }
        return AppTextButton(
          buttonText: checkoutCubit.selectedPaymentMethodTitle.isEmpty
              ? 'Select Payment Method'
              : 'Pay with ${checkoutCubit.selectedPaymentMethodTitle}',
          isDisabled: checkoutCubit.selectedPaymentMethodTitle.isEmpty ? true : false,
          onPressed: () {
            if (checkoutCubit.selectedPaymentMethodTitle == AppConstants.paymop) {
              paymentCubit.payUsingPaymob();
            }
            if (checkoutCubit.selectedPaymentMethodTitle ==  AppConstants.stripe) {
              paymentCubit.payUsingStripe();
            }
            if (checkoutCubit.selectedPaymentMethodTitle ==  AppConstants.paypal) {
              paymentCubit.payUsingPaypal(context);
            }
          },
        );
      },
    );
  }



}
