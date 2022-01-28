import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/empty_state.dart';

import '../grocery_search_tile.dart';
import '../grocery_search_tile_model_data.dart';

class GrocerySearchGridView extends StatelessWidget {
  final ValueListenable<List<GrocerySearchTileModelData>> groceriesListenable;

  const GrocerySearchGridView({
    Key? key,
    required this.groceriesListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ValueListenableBuilder<List<GrocerySearchTileModelData>>(
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
                  childAspectRatio: 0.85,
                ),
                itemCount: groceries.length,
                itemBuilder: (context, int index) {
                  GrocerySearchTileModelData modelData = groceries[index];

                  return GrocerySearchTile(context, modelData);
                },
              );
            } else {
              return const EmptyState();
            }
          }),
    );
  }
}
