
import 'package:flutter/material.dart';
import 'menu_category.dart';
import 'sample_menu.dart';
import 'food_item.dart';

class MenuScreen extends StatelessWidget {

  const MenuScreen({super.key});

  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
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
        ...menuCategory.foodItems.map(_FoodMenuItem.new),
      ],
    );
  }
}

class _FoodMenuItem extends StatelessWidget {
  final FoodItem foodItem;

  const _FoodMenuItem(this.foodItem, {super.key});

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
            onPressed: () {},
            child: Text('Add to cart'),
          ),
        ),
      ),
    );
  }
}