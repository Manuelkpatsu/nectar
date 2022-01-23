import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../select_country_tile.dart';
import '../select_country_tile_model_data.dart';

class CountryList extends StatelessWidget {
  final ValueListenable<List<SelectCountryTileModelData>> countriesListenable;

  const CountryList({
    Key? key,
    required this.countriesListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<List<SelectCountryTileModelData>>(
        valueListenable: countriesListenable,
        builder: (context, countries, child) {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 0),
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return SelectCountryTile(context, countries[index]);
            },
          );
        },
      ),
    );
  }
}
