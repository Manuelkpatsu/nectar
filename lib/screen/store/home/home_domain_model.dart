import 'dart:async';

import 'package:nectar/model/grocery.dart';
import 'package:nectar/repository/grocery_repository.dart';

import 'best_selling/best_selling_tile_model_data.dart';
import 'exclusive/exclusive_tile_model_data.dart';
import 'groceries/groceries_tile_model_data.dart';
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
      List<BestSellingTileModelData> bestSellingList = groceries
          .where((grocery) => grocery.isBestSelling == true)
          .map((grocery) => _bestSellingToTileModelData(grocery))
          .toList();

      List<ExclusiveTileModelData> exclusiveList = groceries
          .where((grocery) => grocery.isExclusive == true)
          .map((grocery) => _exclusiveToTileModelData(grocery))
          .toList();

      List<GroceriesTileModelData> allGroceryList = groceries
          .map((grocery) => _groceriesToTileModelData(grocery))
          .toList();

      _groceriesController.add(HomeModelData(
        bestSellingGroceries: bestSellingList,
        exclusiveGroceries: exclusiveList,
        groceries: allGroceryList,
      ));
    });
  }

  BestSellingTileModelData _bestSellingToTileModelData(Grocery grocery) {
    return BestSellingTileModelData(grocery: grocery);
  }

  ExclusiveTileModelData _exclusiveToTileModelData(Grocery grocery) {
    return ExclusiveTileModelData(grocery: grocery);
  }

  GroceriesTileModelData _groceriesToTileModelData(Grocery grocery) {
    return GroceriesTileModelData(grocery: grocery);
  }

  void dispose() {
    _groceriesController.close();
  }
}
