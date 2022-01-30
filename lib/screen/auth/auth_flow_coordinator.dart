import 'package:flutter/material.dart';
import 'package:nectar/model/country.dart';
import 'package:nectar/screen/store/app_entry/app_entry_screen.dart';

import 'onboarding/welcome_screen.dart';
import 'phone/country/select_country_screen.dart';
import 'phone/number/enter_number_screen.dart';
import 'phone/otp/enter_otp_argument.dart';
import 'phone/otp/enter_otp_screen.dart';
import 'sign_in/sign_in_screen.dart';
import 'sign_in_info/sign_in_info_screen.dart';
import 'sign_up/sign_up_screen.dart';

abstract class AuthFlowCoordinator {
  /// Navigates to SelectCountryScreen and returns the
  /// selected country when closed
  Future<Country?> goToSelectCountryScreen();

  /// Closes SelectCountryScreen and returns the selected country
  ///
  /// [selectedCountry] country selected by the user
  void closeSelectCountryScreen(Country selectedCountry);

  /// Navigates to EnterOTPScreen
  ///
  /// [phoneNumber] phone number to verify
  void goToEnterOTPScreen(String phoneNumber);

  /// Navigates to WelcomeScreen
  void goToWelcomeScreen();

  /// Navigates to SignInInfoScreen
  void goToSignInInfoScreen();

  /// Navigates to SignInScreen
  void goToLoginScreen();

  /// Navigates to SignUpScreen
  void goToSignUpScreen();

  /// Navigates to EnterNumberScreen
  void goToEnterNumberScreen();

  /// Navigates to AppEntryScreen
  void goToAppEntryScreen();
}

class MyAuthFlowCoordinator implements AuthFlowCoordinator {
  final BuildContext _context;

  MyAuthFlowCoordinator(this._context);

  @override
  void closeSelectCountryScreen(Country selectedCountry) {
    Navigator.pop(_context, selectedCountry);
  }

  @override
  Future<Country?> goToSelectCountryScreen() {
    return Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => const SelectCountryScreen(),
      ),
    );
  }

  @override
  void goToEnterOTPScreen(String phoneNumber) {
    final enterOTPArgument = EnterOTPArgument(phoneNumber);

    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => EnterOTPScreen(enterOTPArgument),
      ),
    );
  }

  @override
  void goToWelcomeScreen() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => const WelcomeScreen(),
      ),
    );
  }

  @override
  void goToSignInInfoScreen() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => const SignInInfoScreen(),
      ),
    );
  }

  @override
  void goToLoginScreen() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => const SignInScreen(),
      ),
    );
  }

  @override
  void goToSignUpScreen() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => const SignUpScreen(),
      ),
    );
  }

  @override
  void goToEnterNumberScreen() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => const EnterNumberScreen(),
      ),
    );
  }

  @override
  void goToAppEntryScreen() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => const AppEntryScreen(),
      ),
    );
  }
}
