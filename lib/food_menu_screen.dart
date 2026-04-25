import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'model/food_menu.dart';
import 'model/food_menu_category.dart';
import 'model/food_item.dart';
import 'shopping_cart.dart';

class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  @override
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
                  builder: (context, shoppingCart, _) =>
                      Text('${shoppingCart.totalQuantities}'),
                ),
              ],
            ),
          ),
        ],
        actionsPadding: EdgeInsets.all(4),
      ),
      body: SafeArea(
        child: const _FoodMenuLoader(),
      ),
    );
  }
}

class _FoodMenuLoader extends StatelessWidget {
  const _FoodMenuLoader();

  Future<FoodMenu> _loadFoodMenu() => rootBundle.loadStructuredData(
    'assets/menu.json',
    (stringData) async => FoodMenu.fromJson(JsonDecoder().convert(stringData)),
  );

  @override
  Widget build(BuildContext context) {
    // Exercise: try adding debug prints or breakpoints to _loadFoodMenu(). Does this
    // run more often than it needs to?
    return FutureBuilder(
      future: _loadFoodMenu(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError || !snapshot.hasData) {
            // ideally we'd have a more helpful error message and telemetry for this situation
            return Text('Something has gone wrong with loading the menu. We\'re sorry. Maybe get some Thai food instead?');
          } else {
            return _FoodMenuSectionList(snapshot.data!);
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class _FoodMenuSectionList extends StatelessWidget {
  final FoodMenu data;

  const _FoodMenuSectionList(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.categories.length,
      itemBuilder: (context, index) =>
          _FoodMenuSection(data.categories[index]),
    );
  }
}


class _FoodMenuSection extends StatelessWidget {
  final FoodMenuCategory menuCategory;

  const _FoodMenuSection(this.menuCategory, {super.key});

  build(BuildContext context) {
    return Column(
      children: [
        Text(
          menuCategory.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        ...menuCategory.foodItems.map((foodItem) => _FoodMenuItem(foodItem)),
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
              Text('\$${foodItem.priceInCents / 100.0}'),
            ],
          ),
          subtitle: Text(foodItem.description),
          trailing: ElevatedButton(
            onPressed: () {
              _onAddPressed(context);
            },
            child: Text('Add to cart'),
          ),
        ),
      ),
    );
  }
}
