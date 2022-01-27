import 'dart:async';

import 'package:nectar/repository/grocery_repository.dart';

import 'grocery_model_data.dart';

class GroceryDomainModel {
  final _modelDataController = StreamController<GroceryModelData?>();
  final GroceryRepository _groceryRepository;

  GroceryDomainModel(this._groceryRepository);

  Stream<GroceryModelData?> getGroceryStream(int groceryId) {
    if (!_modelDataController.hasListener) {
      _refreshData(groceryId);
    }
    return _modelDataController.stream.distinct();
  }

  void _refreshData(int groceryId) {
    _groceryRepository.getGrocery(groceryId).then((grocery) {
      GroceryModelData? modelData;
      if (grocery != null) {
        modelData = GroceryModelData(grocery: grocery);
      }
      _modelDataController.add(modelData);
    });
  }

  void dispose() {
    _modelDataController.close();
  }
}
