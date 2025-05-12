import 'package:book_mart/core/helper/spacing.dart';
import 'package:book_mart/features/cart/data/model/cart_model.dart';
import 'package:book_mart/features/cart/data/model/update_cart_model.dart';
import 'package:flutter/material.dart';
import 'cart_Item_details.dart';
import 'cart_item_actions.dart';
import 'cart_item_image.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartItemImage(imageUrl: cartItem.image),
              horizontalSpace(16),
               Expanded(child: CartItemDetails(cartItem: cartItem,)),
            ],
          ),
          verticalSpace(10),
           CartItemActions(updateCartModel :UpdateCartModel(cartItemId: cartItem.itemId, quantity: cartItem.quantity)),
        ],
      ),
    );
  }
}
