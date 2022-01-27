import 'dart:async';

import 'package:nectar/repository/grocery_repository.dart';
import 'package:nectar/screen/store/search/grocery_search/grocery_search_arguments.dart';

import 'grocery_search_tile_model_data.dart';

class GrocerySearchDomainModel {
  final _selectGroceryModelDataStreamController =
      StreamController<List<GrocerySearchTileModelData>>();
  final GroceryRepository _groceryRepository;

  GrocerySearchDomainModel(this._groceryRepository);

  Stream<List<GrocerySearchTileModelData>>
      getGrocerySearchTileModelDataListStream(
          GrocerySearchArguments? arguments) {
    if (!_selectGroceryModelDataStreamController.hasListener) {
      _refreshData(arguments);
    }
    return _selectGroceryModelDataStreamController.stream.distinct();
  }

  void _refreshData(GrocerySearchArguments? arguments) {
    _groceryRepository.getGroceries().then((groceries) {
      List<GrocerySearchTileModelData> groceryList = [];

      if (arguments != null) {
        if (arguments.isBestSelling == true) {
          groceryList = groceries
            .where((grocery) => grocery.isBestSelling == true)
            .map((grocery) => GrocerySearchTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.isExclusive == true) {
          groceryList = groceries
            .where((grocery) => grocery.isExclusive == true)
            .map((grocery) => GrocerySearchTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 1) {
          groceryList = groceries
            .where((grocery) => grocery.category == 1)
            .map((grocery) => GrocerySearchTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 2) {
          groceryList = groceries
            .where((grocery) => grocery.category == 2)
            .map((grocery) => GrocerySearchTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 3) {
          groceryList = groceries
            .where((grocery) => grocery.category == 3)
            .map((grocery) => GrocerySearchTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 4) {
          groceryList = groceries
            .where((grocery) => grocery.category == 4)
            .map((grocery) => GrocerySearchTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 5) {
          groceryList = groceries
            .where((grocery) => grocery.category == 5)
            .map((grocery) => GrocerySearchTileModelData(grocery: grocery))
            .toList();
        } else if (arguments.categoryId == 6) {
          groceryList = groceries
            .where((grocery) => grocery.category == 6)
            .map((grocery) => GrocerySearchTileModelData(grocery: grocery))
            .toList();
        }
      } else {
        groceryList = groceries
            .map((grocery) => GrocerySearchTileModelData(grocery: grocery))
            .toList();
      }
      _selectGroceryModelDataStreamController.add(groceryList);
    });
  }

  void dispose() {
    _selectGroceryModelDataStreamController.close();
  }
}
