// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_menu_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodMenuCategory _$FoodMenuCategoryFromJson(Map<String, dynamic> json) =>
    FoodMenuCategory(
      json['title'] as String,
      (json['foodItems'] as List<dynamic>)
          .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodMenuCategoryToJson(FoodMenuCategory instance) =>
    <String, dynamic>{'title': instance.title, 'foodItems': instance.foodItems};
