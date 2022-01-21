// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';

class Validator {
  static FormFieldValidator<String> email = (email) {
    if (email == null || email.isEmpty) {
      return 'Email is required.';
    }

    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(email)) {
      return 'The email you entered is invalid.';
    }

    return null;
  };

  static FormFieldValidator<String> fullName = (fullName) {
    if (fullName == null || fullName.isEmpty) {
      return 'Full name is required.';
    }
    
    return null;
  };

  static FormFieldValidator<String> password = (password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 7) {
      return "Password is invalid.";
    }

    return null;
  };

  static FormFieldValidator<String> code = (code) {
    if (code == null || code.isEmpty) {
      return 'Code is required.';
    }

    return null;
  };
}
