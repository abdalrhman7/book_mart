import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/features/cart/data/model/cart_model.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_item_widget.dart';

class CartItemsSliverList extends StatelessWidget {
  const CartItemsSliverList({
    super.key, required this.cartData,
  });
  final CartData cartData;

  @override
  Widget build(BuildContext context) {

    return SliverList.separated(
      separatorBuilder: (context, index) => verticalSpace(8),
      itemCount: cartData.cartItems.length,
      itemBuilder: (context, index) {
        return CartItemWidget(cartItem: cartData.cartItems[index]);
      },
    );
  }
}
