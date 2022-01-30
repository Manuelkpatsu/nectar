import 'package:flutter/material.dart';

abstract class SignUpEvent {}

@immutable
class GoToHomeScreenEvent extends SignUpEvent {
  final String fullName;
  final String email;
  final String password;

  GoToHomeScreenEvent(
    this.fullName,
    this.email,
    this.password,
  );
}

class TermsEvent extends SignUpEvent {}

class PolicyEvent extends SignUpEvent {}

class LoginEvent extends SignUpEvent {}
