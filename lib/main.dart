import 'package:flutter/material.dart';
import 'package:pizza_app/menu_category.dart';
import './sample_menu.dart';
import 'food_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarThemeData(backgroundColor: Colors.deepOrangeAccent),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 48,
            fontFamily: 'monospace',
          ),
        ),
      ),
      home: MenuScreen()
    );
  }
}

class MenuScreen extends StatelessWidget {

  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: menuCategories.length,
          itemBuilder: (context, index)  =>
              FoodMenuSection(menuCategories[index]),
        ),
      ),
    );
  }
}

class FoodMenuSection extends StatelessWidget {
  final MenuCategory menuCategory;

  const FoodMenuSection(this.menuCategory, { super.key });

  build(BuildContext context) {
    return Column(
      children: [
        HeadlineText(
          menuCategory.title,
        ),
        ...menuCategory.foodItems.map(FoodMenuItem.new),
      ],
    );
  }
}

class FoodMenuItem extends StatelessWidget {
  final FoodItem foodItem;

  const FoodMenuItem(this.foodItem, {super.key});

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


class HeadlineText extends StatelessWidget {
  final String content;

  const HeadlineText(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
