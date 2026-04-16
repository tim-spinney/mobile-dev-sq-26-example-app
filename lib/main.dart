import 'package:flutter/material.dart';

import 'menu_screen.dart';

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
      debugShowCheckedModeBanner: false,
      home: MenuScreen()
    );
  }
}
