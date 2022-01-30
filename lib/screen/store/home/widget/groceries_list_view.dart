import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/screen/store/grcoery_tile/grocery_tile.dart';
import 'package:nectar/screen/store/grcoery_tile/grocery_tile_model_data.dart';

class GroceriesListView extends StatelessWidget {
  final ValueListenable<List<GroceryTileModelData>> groceriesListenable;

  const GroceriesListView({
    Key? key,
    required this.groceriesListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<GroceryTileModelData>>(
      valueListenable: groceriesListenable,
      builder: (context, groceries, child) {
        if (groceries.isNotEmpty) {
          return SizedBox(
            height: 230,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 4,
              itemBuilder: (context, index) {
                GroceryTileModelData modelData = groceries[index];

                return GroceryTile(context, modelData);
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
