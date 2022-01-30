import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nectar/screen/util.dart';

import '../auth_flow_coordinator.dart';
import 'sign_up_event.dart';

class SignUpNotifier extends ValueNotifier {
  final _logger = Logger();
  final BuildContext _context;
  final AuthFlowCoordinator _authFlowCoordinator;
  late final StreamController<SignUpEvent> _eventController;

  SignUpNotifier(this._context, this._authFlowCoordinator) : super(null);

  void init(StreamController<SignUpEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) {
      _logger.e('Error responding to signup notifier event', error);
    });
  }

  /// Handles [SignUpEvent]
  _handleEvent(SignUpEvent event) {
    if (event is GoToHomeScreenEvent) {
      if (event.fullName.isNotEmpty && event.password.isNotEmpty && event.email.isNotEmpty) {
        _authFlowCoordinator.goToAppEntryScreen();
      } else {
        Util.showSnackbar(
          _context,
          'Sorry, fields cannot empty',
        );
      }
    } else if (event is PolicyEvent) {
    } else if (event is LoginEvent) {
      _authFlowCoordinator.goToLoginScreen();
    } else if (event is TermsEvent) {

    }
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}
