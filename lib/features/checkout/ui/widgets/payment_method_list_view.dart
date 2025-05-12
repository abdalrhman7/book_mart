import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/features/checkout/date/model/payment_methode_model.dart';
import 'package:book_mart/features/checkout/logic/checkout_cubit/checkout_cubit.dart';
import 'package:book_mart/features/checkout/ui/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {

  final List<PaymentMethodeModel> paymentMethode = [
    const PaymentMethodeModel(image: 'assets/images/card.svg', title: AppConstants.stripe),
    const PaymentMethodeModel(image: 'assets/images/paypal.svg', title: AppConstants.paypal),
    const PaymentMethodeModel(image: '', title: AppConstants.paymop),
    // const PaymentMethodeModel(image: '', title: 'Custom'),
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CheckoutCubit>(context);
    return SizedBox(
      height: 68,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding:const  EdgeInsetsDirectional.only(end: 12),
          child: GestureDetector(
            onTap: () {
              activeIndex = index;
              //BlocProvider.of<PaymentCubit>(context).selectedPaymentMethod = paymentMethode[index].title;
              cubit.selectPaymentMethod(paymentMethode[index].title);
              setState(() {});
            },
            child: PaymentMethodItem(
              paymentMethodeModel: paymentMethode[index],
              isActive: activeIndex == index,
              isImage: paymentMethode[index].image != '',
            ),
          ),
        ),
        itemCount: paymentMethode.length,
        shrinkWrap: true,
      ),
    );
  }
}

