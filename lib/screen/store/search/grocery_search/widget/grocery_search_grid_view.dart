import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/screen/store/grcoery_tile/grocery_tile.dart';
import 'package:nectar/screen/store/grcoery_tile/grocery_tile_model_data.dart';
import 'package:nectar/screen/widget/empty_state.dart';

class GrocerySearchGridView extends StatelessWidget {
  final ValueListenable<List<GroceryTileModelData>> groceriesListenable;

  const GrocerySearchGridView({
    Key? key,
    required this.groceriesListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<List<GroceryTileModelData>>(
          valueListenable: groceriesListenable,
          builder: (context, groceries, child) {
            if (groceries.isNotEmpty) {
              return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.70,
                ),
                itemCount: groceries.length,
                itemBuilder: (context, int index) {
                  GroceryTileModelData modelData = groceries[index];

                  return GroceryTile(context, modelData);
                },
              );
            } else {
              return const EmptyState();
            }
          }),
    );
  }
}
