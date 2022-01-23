import 'package:flutter/material.dart';
import 'package:nectar/model/country.dart';

import 'phone/country/select_country_screen.dart';

abstract class AuthFlowCoordinator {
  /// Navigates to SelectCountryScreen and returns the
  /// selected country when closed
  Future<Country?> goToSelectCountryScreen();

  /// Closes SelectCountryScreen and returns the selected country
  ///
  /// [selectedCountry] country selected by the user
  void closeSelectCountryScreen(Country selectedCountry);
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
}
