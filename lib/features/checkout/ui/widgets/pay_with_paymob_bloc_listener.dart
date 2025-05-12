
import 'package:book_mart/core/helper/extensions.dart';
import 'package:book_mart/core/routing/routes.dart';
import 'package:book_mart/features/checkout/logic/payment_cubit/payment__cubit.dart';

import 'package:book_mart/features/checkout/ui/stripe_payment_web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';


class PayWithPaymobBlocListener extends StatelessWidget {
  const PayWithPaymobBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listenWhen: (previous, current) =>
      current is PreparePaymobPaymentSuccess ||
          current is PreparePaymobPaymentFailure,
      listener: (context, state) {
        if (state is PreparePaymobPaymentSuccess){
         context.pushNamed(Routes.paymentWebViewScreen, arguments: {
           'url':  "https://accept.paymob.com/api/acceptance/iframes/778845?payment_token=${state.paymentKeyToken}",
           'cubit': context.read<PaymentCubit>(),
         });
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
