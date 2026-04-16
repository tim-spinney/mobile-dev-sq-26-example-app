
import 'package:flutter/foundation.dart';

import 'food_item.dart';
import 'shopping_cart_item.dart';

class ShoppingCart extends ChangeNotifier {
  final _items = <ShoppingCartItem>[];

  int get numDistinctItems => _items.length;

  int get totalQuantities => _items.fold(
    0,
      (total, item) => total + item.quantity
  );

  addItem(FoodItem foodItem, int quantity) {
    final existingItemIndex = _items.indexWhere(
            (item) => item.foodItem == foodItem
    );
    if(existingItemIndex == -1) {
      _items.add(ShoppingCartItem(foodItem, quantity));
    } else {
      _items[existingItemIndex] = ShoppingCartItem(foodItem, _items[existingItemIndex].quantity + quantity);
    }
    notifyListeners();
  }

  removeItem(FoodItem foodItem) {
    _items.removeWhere((item) => item.foodItem == foodItem);
    notifyListeners();
  }
}