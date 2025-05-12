import 'package:book_mart/core/theming/styels.dart';
import 'package:book_mart/features/cart/data/model/update_cart_model.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCounter extends StatelessWidget {
  const CartItemCounter({
    super.key,
    required this.updateCartModel,
  });

  final UpdateCartModel updateCartModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is UpdateCartSuccess ||
          current is UpdateCartFailure ||
          current is UpdateCartLoading,
      builder: (context, state) {
        if (state is UpdateCartLoading && state.itemId == updateCartModel.cartItemId) {
          return Padding(
            padding:  EdgeInsetsDirectional.only(start: 30.w),
            child: SizedBox(
              height: 25.h,
              width: 25.w,
              child: const CircularProgressIndicator(),
            ),
          );
        }
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                context
                    .read<CartCubit>()
                    .updateCart(updateCartModel..decrementQuantity());
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.remove),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '${updateCartModel.quantity}',
                style: TextStyles.font16BlackSemiBold,
              ),
            ),
            GestureDetector(
              onTap: () {
                context
                    .read<CartCubit>()
                    .updateCart(updateCartModel..incrementQuantity());
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        );
      },
    );
  }
}
