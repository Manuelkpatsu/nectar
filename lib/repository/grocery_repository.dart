import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nectar/model/grocery.dart';

class GroceryRepository {
  GroceryRepository();

  Future<List<Grocery>> getGroceries() async {
    String jsonString = await rootBundle.loadString('data/grocery.json');
    List<dynamic> decodedJson = json.decode(jsonString);

    List<Grocery> groceryList = decodedJson
        .map((groceryJson) => Grocery.fromJson(groceryJson))
        .toList();

    return groceryList;
  }

  Future<Grocery?> getGrocery(int id) async {
    String jsonString = await rootBundle.loadString('data/grocery.json');
    List<dynamic> decodedJson = json.decode(jsonString);

    List<Grocery> groceryList = decodedJson
        .map((groceryJson) => Grocery.fromJson(groceryJson))
        .where((grocery) => grocery.id == id)
        .toList();

    return groceryList[0];
  }
}
