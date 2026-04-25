import 'package:json_annotation/json_annotation.dart';

part 'food_item.g.dart';

@JsonSerializable()
class FoodItem {
  final String name;
  final String description;
  final int priceInCents;

  const FoodItem(this.name, this.description, this.priceInCents);

  static FoodItem fromJson(Map<String, dynamic> json) => _$FoodItemFromJson(json);

  Map<String, dynamic> toJson() => _$FoodItemToJson(this);
}
