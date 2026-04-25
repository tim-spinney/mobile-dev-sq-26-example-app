// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodMenu _$FoodMenuFromJson(Map<String, dynamic> json) => FoodMenu(
  (json['categories'] as List<dynamic>)
      .map((e) => FoodMenuCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FoodMenuToJson(FoodMenu instance) => <String, dynamic>{
  'categories': instance.categories,
};
