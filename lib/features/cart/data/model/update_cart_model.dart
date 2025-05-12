import 'package:json_annotation/json_annotation.dart';
part 'update_cart_model.g.dart';

@JsonSerializable()
class UpdateCartModel {
  @JsonKey(name: 'cart_item_id')
  int cartItemId;
  int quantity;

  UpdateCartModel({required this.cartItemId, required this.quantity});


  Map<String, dynamic> toJson() => _$UpdateCartModelToJson(this);

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
