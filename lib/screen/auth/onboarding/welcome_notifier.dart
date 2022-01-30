import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nectar/screen/auth/onboarding/welcome_event.dart';

import '../auth_flow_coordinator.dart';

class WelcomeNotifier extends ValueNotifier {
  final _logger = Logger();
  final AuthFlowCoordinator _authFlowCoordinator;
  late final StreamController<WelcomeEvent> _eventController;
  
  WelcomeNotifier(this._authFlowCoordinator) : super(null);

  void init(StreamController<WelcomeEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) {
      _logger.e('Error responding to welocme notifier event', error);
    });
  }

  /// Handles [WelcomeEvent]
  void _handleEvent(WelcomeEvent event) {
    if (event is GoToSignInInfoScreenEvent) {
      _authFlowCoordinator.goToSignInInfoScreen();
    }
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}
