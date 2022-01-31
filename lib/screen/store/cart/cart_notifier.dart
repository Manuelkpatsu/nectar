import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../store_flow_coordinator.dart';
import 'cart_event.dart';

class CartNotifier extends ValueNotifier {
  final _logger = Logger();
  final StoreFlowCoordinator _storeFlowCoordinator;
  late final StreamController<CartEvent> _eventController;
  
  CartNotifier(this._storeFlowCoordinator,) : super(null);

  void init(StreamController<CartEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) {
      _logger.e('Error responding to cart notifier event', error);
    });
  }

  /// Handles [CartEvent]
  void _handleEvent(CartEvent event) {
    if (event is CheckoutEvent) {
      _storeFlowCoordinator.showSelectCheckoutOptionsSheet().then((checkoutOption) {
        if (checkoutOption == CheckoutOption.order) {
          _storeFlowCoordinator.goToOrderAcceptedScreen();
        } else if (checkoutOption == CheckoutOption.conditions) {

        } else if (checkoutOption == CheckoutOption.delivery) {

        } else if (checkoutOption == CheckoutOption.payment) {

        } else if (checkoutOption == CheckoutOption.promo) {

        } else if (checkoutOption == CheckoutOption.terms) {

        }
      });
    }
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}