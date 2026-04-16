
import 'package:flutter/material.dart';
import 'menu_category.dart';
import 'sample_menu.dart';
import 'food_item.dart';
import 'shopping_cart.dart';

class MenuScreen extends StatelessWidget {
  final ShoppingCart _shoppingCart = ShoppingCart();

  MenuScreen({super.key});

  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          const Icon(Icons.shopping_cart),
          ListenableBuilder(
            listenable: _shoppingCart,
            builder: (context, _) => Text('${_shoppingCart.totalQuantities}',),
          ),
        ],
        actionsPadding: EdgeInsets.all(4),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: menuCategories.length,
          itemBuilder: (context, index)  =>
              _FoodMenuSection(menuCategories[index], _shoppingCart),
        ),
      ),
    );
  }
}

class _FoodMenuSection extends StatelessWidget {
  final MenuCategory menuCategory;
  final ShoppingCart shoppingCart;

  const _FoodMenuSection(this.menuCategory, this.shoppingCart, { super.key });

  build(BuildContext context) {
    return Column(
      children: [
        Text(
          menuCategory.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        ...menuCategory.foodItems.map(
                (foodItem) => _FoodMenuItem(foodItem, shoppingCart)
        ),
      ],
    );
  }
}

class _FoodMenuItem extends StatelessWidget {
  final FoodItem foodItem;
  final ShoppingCart shoppingCart;

  const _FoodMenuItem(this.foodItem, this.shoppingCart, {super.key});

  _onAddPressed() {
    shoppingCart.addItem(foodItem, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(foodItem.name),
                Text('\$${foodItem.priceInCents/100.0}'),
              ]
          ),
          subtitle: Text(foodItem.description),
          trailing: ElevatedButton(
            onPressed: _onAddPressed,
            child: Text('Add to cart'),
          ),
        ),
      ),
    );
  }
}