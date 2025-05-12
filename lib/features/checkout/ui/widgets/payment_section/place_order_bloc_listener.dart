

import 'package:book_mart/features/checkout/logic/payment_cubit/payment__cubit.dart';
import 'package:book_mart/features/checkout/ui/payment_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderBlocListener extends StatelessWidget {
  const PlaceOrderBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PlaceOrderSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const PaymentSuccessScreen()),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}