import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nectar/model/category.dart';

class CategoryRepository {
  CategoryRepository();

  Future<List<Category>> getCategories() async {
    String jsonString = await rootBundle.loadString('data/category.json');
    List<dynamic> decodedJson = json.decode(jsonString);

    List<Category> categoriesList = decodedJson
        .map((categoryJson) => Category.fromJson(categoryJson))
        .toList();

    return categoriesList;
  }
}
