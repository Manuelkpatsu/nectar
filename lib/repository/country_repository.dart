import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nectar/model/country.dart';

class CountryRepository {
  CountryRepository();

  Future<List<Country>> getCountries() async {
    String jsonString =
        await rootBundle.loadString('data/country.json');
    List<dynamic> decodedJson = json.decode(jsonString);

    List<Country> countriesList = decodedJson
        .map((countryJson) => Country.fromJson(countryJson))
        .toList();

    return countriesList;
  }
}
