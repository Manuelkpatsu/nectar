import 'dart:async';

import 'package:logger/logger.dart';

import '../../store_flow_coordinator.dart';
import 'exclusive_tile_event.dart';

class ExclusiveTileEventHandler {
  final _logger = Logger();
  final StoreFlowCoordinator _storeFlowCoordinator;
  late final StreamController<ExclusiveTileEvent> _eventController;

  ExclusiveTileEventHandler(this._storeFlowCoordinator);

  void init(StreamController<ExclusiveTileEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) => _logger.e("Error responding to event", error));
  }

  /// Handles [ExclusiveTileEvent]
  _handleEvent(ExclusiveTileEvent event) {
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
