import 'dart:async';

import 'package:nectar/repository/grocery_repository.dart';
import 'package:nectar/screen/store/grcoery_tile/grocery_tile_model_data.dart';
import 'package:nectar/screen/store/search/grocery_search/grocery_search_arguments.dart';

class GrocerySearchDomainModel {
  final _selectGroceryModelDataStreamController =
      StreamController<List<GroceryTileModelData>>();
  final GroceryRepository _groceryRepository;

  GrocerySearchDomainModel(this._groceryRepository);

  Stream<List<GroceryTileModelData>>
      getGrocerySearchTileModelDataListStream(
          GrocerySearchArguments? arguments) {
    if (!_selectGroceryModelDataStreamController.hasListener) {
      _refreshData(arguments);
    }
    return _selectGroceryModelDataStreamController.stream.distinct();
  }

  void _refreshData(GrocerySearchArguments? arguments) {
    _groceryRepository.getGroceries().then((groceries) {
      List<GroceryTileModelData> groceryList = [];

      if (arguments != null) {
        if (arguments.isBestSelling == true) {
          groceryList = groceries
            .where((grocery) => grocery.isBestSelling == true)
            .map((grocery) => GroceryTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.isExclusive == true) {
          groceryList = groceries
            .where((grocery) => grocery.isExclusive == true)
            .map((grocery) => GroceryTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 1) {
          groceryList = groceries
            .where((grocery) => grocery.category == 1)
            .map((grocery) => GroceryTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 2) {
          groceryList = groceries
            .where((grocery) => grocery.category == 2)
            .map((grocery) => GroceryTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 3) {
          groceryList = groceries
            .where((grocery) => grocery.category == 3)
            .map((grocery) => GroceryTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 4) {
          groceryList = groceries
            .where((grocery) => grocery.category == 4)
            .map((grocery) => GroceryTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 5) {
          groceryList = groceries
            .where((grocery) => grocery.category == 5)
            .map((grocery) => GroceryTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 6) {
          groceryList = groceries
            .where((grocery) => grocery.category == 6)
            .map((grocery) => GroceryTileModelData(grocery: grocery))
            .toList();
        }
      } else {
        groceryList = groceries
            .map((grocery) => GroceryTileModelData(grocery: grocery))
            .toList();
      }
      _selectGroceryModelDataStreamController.add(groceryList);
    });
  }

  void dispose() {
    _selectGroceryModelDataStreamController.close();
  }
}
