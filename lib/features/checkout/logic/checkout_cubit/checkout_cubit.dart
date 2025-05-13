import 'dart:convert';

import 'package:book_mart/core/constants/app_constants.dart';
import 'package:book_mart/core/helper/shared_pref_helper.dart';
import 'package:book_mart/features/auth/data/models/login_model/user_data_response.dart';
import 'package:book_mart/features/checkout/date/model/checkout_model.dart';
import 'package:book_mart/features/checkout/date/repo/checkout_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_payment_gateway/transaction.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutRepo) : super(CheckoutInitial());
  final CheckoutRepo checkoutRepo;

  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  String subTotal = '';
  String priceBeforeDiscount = '';
  bool? isCashPayment;
  String selectedPaymentMethodTitle = '';
  List<CheckoutCartItem> cartItems = [];

  bool isDiscountApplied = false;

  // Form controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> checkoutFormKey = GlobalKey<FormState>();
  final ValueNotifier<AutovalidateMode> autoValidateModeNotifier =
      ValueNotifier(AutovalidateMode.disabled);

  Future<void> loadUserDataToForm() async {
    final json = await SharedPrefHelper.getString(SharedPrefKeys.userData);
    final user = User.fromJson(jsonDecode(json));
    emailController.text = user.email ?? '';
    nameController.text = user.name ?? '';
    addressController.text = user.address ?? '';
    cityController.text = user.city ?? '';
    phoneController.text = user.phone ?? '';
  }

  void setIsDiscountApplied(bool value) {
    isDiscountApplied = value;
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethodTitle = method;
    emit(PaymentMethodSelected());
  }

  Future<void> getCartItems() async {
    emit(GetCartItemsLoading());
    final result = await checkoutRepo.getCartItems();
    result.when(
      success: (data) {
        cartItems = data.cartItems;

        double total = double.tryParse(data.total) ?? 0;

        if (isDiscountApplied) {
          priceBeforeDiscount = data.total;
          total *= 0.9;
        }

        subTotal = total.toStringAsFixed(2);

        emit(GetCartItemsSuccess());
      },
      failure: (error) {
        emit(GetCartItemsFailure());
      },
    );
  }

  String getTotal() {
    double subtotal = double.tryParse(subTotal) ?? 0;

    final total = isCashPayment == true ? subtotal + 30 : subtotal;

    if (total == total.toInt()) {
      return total.toInt().toString();
    }
    return total.toStringAsFixed(2);
  }

  List<ProductItem> buildPaypalProductItems() {
    return cartItems.map((item) {
      final originalTotal = double.tryParse(item.total) ?? 0;
      final effectiveTotal = isDiscountApplied
          ? originalTotal * 0.9
          : originalTotal;
      final unitPrice = effectiveTotal / item.quantity;

      return ProductItem(
        name: item.name,
        quantity: item.quantity,
        price: unitPrice.toStringAsFixed(2),
        currency: 'USD',
      );
    }).toList();
  }

  Transaction buildPaypalTransaction() {
    final items = buildPaypalProductItems();
    final shippingStr = isCashPayment == true ? '30' : '0';

    return Transaction(
      description: 'Order from Book Mart',
      items: items,
      shipping: shippingStr,
      shippingDiscount: 0,
    );
  }

}
