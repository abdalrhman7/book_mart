import 'package:book_mart/core/di/dependency_injection.dart';
import 'package:book_mart/features/checkout/date/repo/checkout_repo.dart';
import 'package:book_mart/features/checkout/logic/checkout_cubit/checkout_cubit.dart';
import 'package:book_mart/features/checkout/logic/payment_cubit/payment__cubit.dart';
import 'package:book_mart/features/checkout/ui/widgets/checkout_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.isDiscountApplied});

  final bool isDiscountApplied;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => getIt<CheckoutCubit>()
                ..getCartItems()
                ..loadUserDataToForm()
                ..setIsDiscountApplied(isDiscountApplied)),
          BlocProvider(
            create: (context) => PaymentCubit(
              checkoutRepo: getIt<CheckoutRepo>(),
              checkoutCubit: context.read<CheckoutCubit>(),
            ),
          ),
        ],
        child: const CheckoutBody(),
      ),
    );
  }
}
