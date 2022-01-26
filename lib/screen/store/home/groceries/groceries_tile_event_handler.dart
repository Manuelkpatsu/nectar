import 'dart:async';

import 'package:logger/logger.dart';

import '../../store_flow_coordinator.dart';
import 'groceries_tile_event.dart';

class GroceriesTileEventHandler {
  final _logger = Logger();
  final StoreFlowCoordinator _storeFlowCoordinator;
  late final StreamController<GroceriesTileEvent> _eventController;

  GroceriesTileEventHandler(this._storeFlowCoordinator);

  void init(StreamController<GroceriesTileEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) => _logger.e("Error responding to event", error));
  }

  /// Handles [GroceriesTileEvent]
  _handleEvent(GroceriesTileEvent event) {
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
