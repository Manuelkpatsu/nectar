import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nectar/repository/user_repository.dart';

import 'account_model_data.dart';

class AccountNotifier extends ValueNotifier<AccountModelData> {
  final _logger = Logger();
  final UserRepository _userRepository;

  AccountNotifier(this._userRepository) : super(const AccountModelData());

  void init() {
    _getUser();
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
}
