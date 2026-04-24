import 'package:go_router/go_router.dart';
import 'package:pizza_app/menu_screen.dart';
import 'package:pizza_app/shopping_cart_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, _) => MenuScreen(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, _) => ShoppingCartScreen(),
    ),
  ],
);