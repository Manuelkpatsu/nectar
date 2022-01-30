import 'dart:async';

import 'package:logger/logger.dart';

import '../store_flow_coordinator.dart';
import 'grocery_tile_event.dart';

class GroceryTileEventHandler {
  final _logger = Logger();
  final StoreFlowCoordinator _storeFlowCoordinator;
  late final StreamController<GroceryTileEvent> _eventController;

  GroceryTileEventHandler(this._storeFlowCoordinator);

  void init(StreamController<GroceryTileEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) => _logger.e("Error responding to event", error));
  }

  /// Handles [GroceryTileEvent]
  _handleEvent(GroceryTileEvent event) {
    switch (event.runtimeType) {
      case GoToGroceryScreenEvent:
        final groceryEvent = event as GoToGroceryScreenEvent;
        _storeFlowCoordinator.goToGroceryScreen(groceryEvent.id);
        break;
      case ToggleFavoriteEvent:
        break;
    }
  }

  void dispose() {
    _eventController.close();
  }
}
