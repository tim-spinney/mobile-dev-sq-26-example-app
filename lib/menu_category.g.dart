// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) => MenuCategory(
  json['title'] as String,
  (json['foodItems'] as List<dynamic>)
      .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MenuCategoryToJson(MenuCategory instance) =>
    <String, dynamic>{'title': instance.title, 'foodItems': instance.foodItems};
