import 'package:json_annotation/json_annotation.dart';
import 'food_item.dart';

part 'food_menu_category.g.dart';

@JsonSerializable()
class FoodMenuCategory {
  final String title;
  final List<FoodItem> foodItems;

  const FoodMenuCategory(this.title, this.foodItems);

  static FoodMenuCategory fromJson(Map<String, dynamic> json) => _$FoodMenuCategoryFromJson(json);
}