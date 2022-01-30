import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../auth_flow_coordinator.dart';
import 'sign_in_info_event.dart';

class SignInInfoNotifier extends ValueNotifier {
  final _logger = Logger();
  final AuthFlowCoordinator _authFlowCoordinator;
  late final StreamController<SignInInfoEvent> _eventController;
  
  SignInInfoNotifier(this._authFlowCoordinator) : super(null);

  void init(StreamController<SignInInfoEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) {
      _logger.e('Error responding to signin info notifier event', error);
    });
  }

  /// Handles [SignInInfoEvent]
  void _handleEvent(SignInInfoEvent event) {
    if (event is PhoneSignInEvent) {
      _authFlowCoordinator.goToEnterNumberScreen();
    } else if (event is EmailSignInEvent) {
      _authFlowCoordinator.goToLoginScreen();
    } else if (event is FacebookSignInEvent) {

    } else if (event is GoogleSignInEvent) {

    }
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}
