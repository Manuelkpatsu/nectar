import 'dart:async';

import 'package:nectar/model/grocery.dart';
import 'package:nectar/repository/grocery_repository.dart';
import 'package:nectar/screen/store/grcoery_tile/grocery_tile_model_data.dart';

import 'home_model_data.dart';

class HomeDomainModel {
  final _groceriesController = StreamController<HomeModelData>();
  final GroceryRepository _groceryRepository;

  HomeDomainModel(this._groceryRepository);

  Stream<HomeModelData> getGroceriesStream() {
    if (!_groceriesController.hasListener) {
      _refreshData();
    }
    return _groceriesController.stream.distinct();
  }

  void _refreshData() {
    _groceryRepository.getGroceries().then((groceries) {
      List<GroceryTileModelData> bestSellingList = groceries
          .where((grocery) => grocery.isBestSelling == true)
          .map((grocery) => _groceryToTileModelData(grocery))
          .toList();

      List<GroceryTileModelData> exclusiveList = groceries
          .where((grocery) => grocery.isExclusive == true)
          .map((grocery) => _groceryToTileModelData(grocery))
          .toList();

      List<GroceryTileModelData> allGroceryList = groceries
          .map((grocery) => _groceryToTileModelData(grocery))
          .toList();

      _groceriesController.add(HomeModelData(
        bestSellingGroceries: bestSellingList,
        exclusiveGroceries: exclusiveList,
        groceries: allGroceryList,
      ));
    });
  }

  GroceryTileModelData _groceryToTileModelData(Grocery grocery) {
    return GroceryTileModelData(grocery: grocery);
  }

  void dispose() {
    _groceriesController.close();
  }
}
