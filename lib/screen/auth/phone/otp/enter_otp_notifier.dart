import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:nectar/screen/util.dart';

import '../../auth_flow_coordinator.dart';
import 'enter_otp_event.dart';
import 'enter_otp_model_data.dart';

class EnterOTPNotifier extends ValueNotifier<EnterOTPModelData> {
  final _logger = Logger();
  late final StreamController<EnterOTPEvent> _eventController;
  final BuildContext _context;
  final AuthFlowCoordinator _authFlowCoordinator;
  StreamSubscription? _countDownSubscription;

  EnterOTPNotifier(this._context, this._authFlowCoordinator) : super(const EnterOTPModelData());

  void init(StreamController<EnterOTPEvent> eventController) {
    _eventController = eventController;

    _eventController.stream
        .listen((event) => _handleEvent(event))
        .onError((error) => _logger.e('Error responding to event', error));

    _startCountDownTimer();
  }

  /// Handles [EnterOTPEvent]
  _handleEvent(EnterOTPEvent event) {
    switch (event.runtimeType) {
      case ResendCodeEvent:
        value = const EnterOTPModelData();
        _startCountDownTimer();
        break;
      case SignInWithSMSCodeEvent:
        final signInWithSMSCodeEvent = event as SignInWithSMSCodeEvent;
        _signInWithSMSCode(signInWithSMSCodeEvent.otp);
        break;
    }
  }

  void _startCountDownTimer() {
    _countDownSubscription = Stream.periodic(const Duration(seconds: 1), (v) => v)
        .take(15)
        .listen((count) {
      int newTime = value.countDownTimeInSecs - 1;
      value = value.copyWith(countDownTimeInSecs: newTime);
    });
  }

  void _signInWithSMSCode(String smsCode) {
    if (smsCode.isNotEmpty) {
      Util.showSnackbar(_context, 'Successfull');
    } else {
      Util.showSnackbar(_context, 'OTP code cannot be empty.');
    }
  }

  @override
  dispose() {
    _countDownSubscription!.cancel();
    _eventController.close();
    super.dispose();
  }
}
