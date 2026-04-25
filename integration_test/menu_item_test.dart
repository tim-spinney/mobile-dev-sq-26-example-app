import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pizza_app/model/food_item.dart';
import 'package:pizza_app/main.dart';
import 'package:pizza_app/shopping_cart.dart';
import 'package:pizza_app/shopping_cart_item.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('example', (tester) async {

    await tester.pumpWidget(MyApp());

    await tester.tap(find.byType(ElevatedButton).first);

    await Future.delayed(Duration(seconds: 5));

    await tester.scrollUntilVisible(find.byType(ElevatedButton).last, 120);

    await tester.pumpAndSettle();

    await tester.tap(find.byType(ElevatedButton).last);

    await Future.delayed(Duration(seconds: 5));
  });

  testWidgets('adds item to shopping cart', (tester) async {

  });

}