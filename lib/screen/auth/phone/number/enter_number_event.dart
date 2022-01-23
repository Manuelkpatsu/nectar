import 'package:flutter/material.dart';

abstract class EnterNumberEvent {}

class GoToSelectCountryScreenEvent extends EnterNumberEvent {}

@immutable
class VerifyPhoneNumberEvent extends EnterNumberEvent {
  final String phoneNumber;

  VerifyPhoneNumberEvent(this.phoneNumber);
}
