import 'package:book_mart/core/widgets/show_bar.dart';
import 'package:book_mart/features/cart/data/model/update_cart_model.dart';
import 'package:book_mart/features/cart/logic/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_item_counter.dart';

class CartItemActions extends StatelessWidget {
  const CartItemActions({super.key, required this.updateCartModel});

  final UpdateCartModel updateCartModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listenWhen: (previous, current) =>
          current is RemoveItemFromCartSuccess ||
          current is RemoveItemFromCartFailure,
      listener: (context, state) {
        if (state is RemoveItemFromCartSuccess) {
          showBar(context, 'Item Removed Successfully');
        }
        if (state is RemoveItemFromCartFailure) {
          showBar(context, state.apiErrorModel.getAllErrorsMessages());
        }
      },
      child: Row(
        children: [
          CartItemCounter(updateCartModel: updateCartModel),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            padding: const EdgeInsets.all(6),
            child: GestureDetector(
              onTap: () {
                context.read<CartCubit>().removeItem(updateCartModel.cartItemId);
              },
              child: BlocBuilder<CartCubit, CartState>(
                buildWhen: (previous, current) =>
                    current is RemoveItemFromCartLoading ||
                    current is RemoveItemFromCartSuccess,
                builder: (context, state) {
                  if (state is RemoveItemFromCartLoading &&
                      updateCartModel.cartItemId == state.itemId) {
                    return const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator());
                  }
                  return const Icon(Icons.delete_outline, size: 20);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
