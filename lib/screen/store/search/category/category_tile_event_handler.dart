import 'dart:async';

import 'package:logger/logger.dart';

import '../../store_flow_coordinator.dart';
import 'category_tile_event.dart';

class CategoryTileEventHandler {
  final _logger = Logger();
  final StoreFlowCoordinator _storeFlowCoordinator;
  late final StreamController<CategoryTileEvent> _eventController;

  CategoryTileEventHandler(this._storeFlowCoordinator);

  void init(StreamController<CategoryTileEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) => _logger.e("Error responding to event", error));
  }

  /// Handles [CategoryTileEvent]
  _handleEvent(CategoryTileEvent event) {
    switch (event.runtimeType) {
      case GoToGrocerySearchScreenEvent:
        final grocerySearchEvent = event as GoToGrocerySearchScreenEvent;
        _storeFlowCoordinator.goToGrocerySearchScreen(grocerySearchEvent.id);
        break;
    }
  }

  void dispose() {
    _eventController.close();
  }
}
