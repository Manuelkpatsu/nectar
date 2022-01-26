import 'dart:async';

import 'package:logger/logger.dart';

import '../../store_flow_coordinator.dart';
import 'best_selling_tile_event.dart';

class BestSellingTileEventHandler {
  final _logger = Logger();
  final StoreFlowCoordinator _storeFlowCoordinator;
  late final StreamController<BestSellingTileEvent> _eventController;

  BestSellingTileEventHandler(this._storeFlowCoordinator);

  void init(StreamController<BestSellingTileEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) => _logger.e("Error responding to event", error));
  }

  /// Handles [BestSellingTileEvent]
  _handleEvent(BestSellingTileEvent event) {
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
