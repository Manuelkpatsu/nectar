import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/screen/store/home/groceries/groceries_tile.dart';
import 'package:nectar/screen/store/home/groceries/groceries_tile_model_data.dart';

class GroceriesListView extends StatelessWidget {
  final ValueListenable<List<GroceriesTileModelData>> groceriesListenable;

  const GroceriesListView({
    Key? key,
    required this.groceriesListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<GroceriesTileModelData>>(
      valueListenable: groceriesListenable,
      builder: (context, groceries, child) {
        if (groceries.isNotEmpty) {
          return SizedBox(
            height: 240,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 4,
              itemBuilder: (context, index) {
                GroceriesTileModelData modelData = groceries[index];

                return GroceriesTile(context, modelData);
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
