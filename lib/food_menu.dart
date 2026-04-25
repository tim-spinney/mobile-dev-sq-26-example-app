
import 'package:json_annotation/json_annotation.dart';
import 'package:pizza_app/menu_category.dart';

part 'food_menu.g.dart';

@JsonSerializable()
class FoodMenu {
  final List<MenuCategory> categories;

  FoodMenu(this.categories);

  static FoodMenu fromJson(Map<String, dynamic> json) => _$FoodMenuFromJson(json);
}