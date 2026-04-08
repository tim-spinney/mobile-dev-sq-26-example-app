import 'package:flutter/material.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeadlineText(
                'Starters',
              ),
              FoodMenuItem(
                FoodItem(
                    'Garlic Knots',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    599
                ),
              ),
              FoodMenuItem(
                FoodItem(
                    'Chicken Wings (6pcs)',
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    899
                ),
              ),
              HeadlineText(
                'Pizzas',
              ),
              HeadlineText(
                'Drinks',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodItem {
  final String name;
  final String description;
  final int priceInCents;

  FoodItem(this.name, this.description, this.priceInCents);
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
