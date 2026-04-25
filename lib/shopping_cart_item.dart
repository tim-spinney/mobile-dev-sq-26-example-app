
import 'package:pizza_app/model/food_item.dart';

class ShoppingCartItem {
  final FoodItem foodItem;
  final int quantity;

  ShoppingCartItem(this.foodItem, this.quantity);

  int get totalPriceInCents => foodItem.priceInCents * quantity;
}