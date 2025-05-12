import 'package:book_mart/features/checkout/logic/payment_cubit/payment__cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayWithStripeBlocListener extends StatelessWidget {
  const PayWithStripeBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if(state is StripePaymentSuccess){
          context.read<PaymentCubit>().placeOrder();
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
