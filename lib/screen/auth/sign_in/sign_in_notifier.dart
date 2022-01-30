import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nectar/screen/util.dart';

import '../auth_flow_coordinator.dart';
import 'sign_in_event.dart';

class SignInNotifier extends ValueNotifier {
  final _logger = Logger();
  final BuildContext _context;
  final AuthFlowCoordinator _authFlowCoordinator;
  late final StreamController<SignInEvent> _eventController;

  SignInNotifier(this._context, this._authFlowCoordinator) : super(null);

  void init(StreamController<SignInEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) {
      _logger.e('Error responding to signin notifier event', error);
    });
  }

  /// Handles [SignInEvent]
  _handleEvent(SignInEvent event) {
    if (event is GoToHomeScreenEvent) {
      if (event.password.isNotEmpty && event.email.isNotEmpty) {
        _authFlowCoordinator.goToAppEntryScreen();
      } else {
        Util.showSnackbar(
          _context,
          'Sorry, fields cannot be empty',
        );
      }
    } else if (event is ForgotPasswordEvent) {
    } else if (event is CreateNewAccountEvent) {
      _authFlowCoordinator.goToSignUpScreen();
    }
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}
