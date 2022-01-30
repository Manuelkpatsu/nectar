import 'package:flutter/material.dart';

abstract class SignInEvent {}

@immutable
class GoToHomeScreenEvent extends SignInEvent {
  final String email;
  final String password;

  GoToHomeScreenEvent(this.email, this.password);
}

class ForgotPasswordEvent extends SignInEvent {}

class CreateNewAccountEvent extends SignInEvent {}
