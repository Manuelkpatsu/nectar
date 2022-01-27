import 'dart:async';

import 'package:logger/logger.dart';

import '../../store_flow_coordinator.dart';
import 'grocery_search_tile_event.dart';

class GrocerySearchTileEventHandler {
  final _logger = Logger();
  final StoreFlowCoordinator _storeFlowCoordinator;
  late final StreamController<GrocerySearchTileEvent> _eventController;

  GrocerySearchTileEventHandler(this._storeFlowCoordinator);

  void init(StreamController<GrocerySearchTileEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) => _logger.e("Error responding to event", error));
  }

  /// Handles [GrocerySearchTileEvent]
  _handleEvent(GrocerySearchTileEvent event) {
    switch (event.runtimeType) {
      case GoToGroceryScreenEvent:
        final groceryEvent = event as GoToGroceryScreenEvent;
        _storeFlowCoordinator.goToGroceryScreen(groceryEvent.id);
        break;
    }
  }

  void dispose() {
    _eventController.close();
  }
}
