import 'package:json_annotation/json_annotation.dart';
import 'food_item.dart';

part 'menu_category.g.dart';

@JsonSerializable()
class MenuCategory {
  final String title;
  final List<FoodItem> foodItems;

  const MenuCategory(this.title, this.foodItems);

  static MenuCategory fromJson(Map<String, dynamic> json) => _$MenuCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$MenuCategoryToJson(this);
}