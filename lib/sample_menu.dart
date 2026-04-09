import 'food_item.dart';
import 'menu_category.dart';

const _sampleStartersMenu = [
  FoodItem(
    'Garlic Knots',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    599
  ),
  FoodItem(
      'Chicken Wings (6pcs)',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      899
  ),
  FoodItem(
    'Foo',
    'Bar',
    9999
  )
];

const _samplePizzaMenu = <FoodItem>[];

const _sampleDrinksMenu = [
  FoodItem(
    'La Croix',
    'Water, but not boring',
    399,
  ),
  FoodItem(
    'Water',
    'La Croix, but healthier',
    0,
  ),
];

const menuCategories = [
  MenuCategory('Starters', _sampleStartersMenu),
  MenuCategory('Pizzas', _samplePizzaMenu),
  MenuCategory('Drinks', _sampleDrinksMenu),
];