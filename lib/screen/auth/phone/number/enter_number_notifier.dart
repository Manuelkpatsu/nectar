import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../auth_flow_coordinator.dart';
import 'enter_number_event.dart';
import 'enter_number_model_data.dart';

class EnterNumberNotifier extends ValueNotifier<EnterNumberModelData> {
  final _logger = Logger();
  final AuthFlowCoordinator _authFlowCoordinator;
  late final StreamController<EnterNumberEvent> _eventController;

  EnterNumberNotifier(this._authFlowCoordinator) : super(const EnterNumberModelData());

  void init(StreamController<EnterNumberEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) {
      _logger.e('Error responding to product index notifier event', error);
    });
  }

  /// Handles [EnterNumberEvent]
  _handleEvent(EnterNumberEvent event) {
    switch (event.runtimeType) {
      case VerifyPhoneNumberEvent:
        final phoneNumber = (event as VerifyPhoneNumberEvent).phoneNumber;
        break;
      case GoToSelectCountryScreenEvent:
        _goToSelectCountryScreen();
        break;
    }
  }

  void _goToSelectCountryScreen() {
    _authFlowCoordinator.goToSelectCountryScreen().then((selectedCountry) {
      if (selectedCountry != null) {
        value = value.copyWith(
          countryCode: selectedCountry.code,
          countryDialCode: selectedCountry.dialCode,
        );
      }
    });
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}
