import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../store_flow_coordinator.dart';
import 'order_accepted_event.dart';

class OrderAcceptedNotifier extends ValueNotifier {
  final _logger = Logger();
  final StoreFlowCoordinator _storeFlowCoordinator;
  late final StreamController<OrderAcceptedEvent> _eventController;

  OrderAcceptedNotifier(this._storeFlowCoordinator) : super(null);

  void init(StreamController<OrderAcceptedEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) {
      _logger.e('Error responding to order accepted notifier event', error);
    });
  }

  /// Handles [OrderAcceptedEvent]
  void _handleEvent(OrderAcceptedEvent event) {
    if (event is TrackOrderEvent) {
    } else if (event is BackToHomeEvent) {
      _storeFlowCoordinator.goToHomeScreen();
    }
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}
