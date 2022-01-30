import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nectar/repository/user_repository.dart';

import '../store_flow_coordinator.dart';
import 'account_event.dart';
import 'account_model_data.dart';

class AccountNotifier extends ValueNotifier<AccountModelData> {
  final _logger = Logger();
  final UserRepository _userRepository;
  final StoreFlowCoordinator _storeFlowCoordinator;
  late final StreamController<AccountEvent> _eventController;

  AccountNotifier(this._userRepository, this._storeFlowCoordinator) : super(const AccountModelData());

  void init(StreamController<AccountEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) => _logger.e('Error responding to event', error));

    _getUser();
  }

  /// Handles [AccountEvent]
  _handleEvent(AccountEvent event) {
    switch (event.runtimeType) {
      case LogoutEvent:
        _storeFlowCoordinator.goToSignInInfoScreen();
        break;
    }
  }

  void _getUser() {
    _userRepository.getUser().then((user) {
      value = value.copyWith(
        email: user.email,
        name: user.name,
        image: user.image,
      );
    }).catchError((error) {
      _logger.e('Error loading user', error);
    });
  }

  @override
  void dispose() {
    _eventController.close();
    super.dispose();
  }
}
