import 'package:flutter/material.dart';
import 'package:nectar/screen/auth/auth_flow_coordinator.dart';

class SplashNotifier extends ValueNotifier {
  final AuthFlowCoordinator _authFlowCoordinator;

  SplashNotifier(this._authFlowCoordinator) : super(null);

  void init() {
    Future.delayed(
      const Duration(seconds: 4),
      () => _authFlowCoordinator.goToWelcomeScreen(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
