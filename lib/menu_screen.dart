
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'menu_category.dart';
import 'sample_menu.dart';
import 'food_item.dart';
import 'shopping_cart.dart';

class MenuScreen extends StatelessWidget {

  MenuScreen({super.key});

  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.push('/cart');
            },
            icon: Row(
              children: [
                const Icon(Icons.shopping_cart),
                Consumer<ShoppingCart>(
                  builder: (context, shoppingCart, _) => Text('${shoppingCart.totalQuantities}',),
                ),
              ],
            ),
          ),

        ],
        actionsPadding: EdgeInsets.all(4),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: menuCategories.length,
          itemBuilder: (context, index)  =>
              _FoodMenuSection(menuCategories[index]),
        ),
      ),
    );
  }
}

class _FoodMenuSection extends StatelessWidget {
  final MenuCategory menuCategory;

  const _FoodMenuSection(this.menuCategory, { super.key });

  build(BuildContext context) {
    return Column(
      children: [
        Text(
          menuCategory.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        ...menuCategory.foodItems.map(
                (foodItem) => _FoodMenuItem(foodItem)
        ),
      ],
    );
  }
}

class _FoodMenuItem extends StatelessWidget {
  final FoodItem foodItem;

  const _FoodMenuItem(this.foodItem, {super.key});

  _onAddPressed(BuildContext context) {
    /* read() is good for when we want to call a mutator on our ChangeNotifier
       watch() will subscribe us for re-builds on changes which we don't actually
       want for this widget (yet?).
     */
    final shoppingCart = context.read<ShoppingCart>();
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
            onPressed: () { _onAddPressed(context); },
            child: Text('Add to cart'),
          ),
        ),
      ),
    );
  }
}