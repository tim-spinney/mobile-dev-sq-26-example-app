
import 'dart:convert';
import 'dart:io';

import 'package:pizza_app/sample_menu.dart';

void main() async {
  final encoder = JsonEncoder();
  final json = encoder.convert(menuCategories);
  await File("assets/menu.json").writeAsString(json);
}