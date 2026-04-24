import 'package:flutter/material.dart';
import 'package:pizza_app/routing.dart';
import 'package:pizza_app/shopping_cart.dart';
import 'package:provider/provider.dart';

void main() {
  final shoppingCart = ShoppingCart();
  /* Exercise: try moving this Provider to different parts of the widget tree.
     What is the boundary of where it no longer works? Are there places where it
     works at first but gets reset unexpectedly?
   */
  runApp(
    ChangeNotifierProvider.value(
      value: shoppingCart,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarThemeData(backgroundColor: Colors.deepOrangeAccent),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 48,
            fontFamily: 'monospace',
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
