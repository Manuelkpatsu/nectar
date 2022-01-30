import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/screen/store/grcoery_tile/grocery_tile.dart';
import 'package:nectar/screen/store/grcoery_tile/grocery_tile_model_data.dart';

class BestSellingListView extends StatelessWidget {
  final ValueListenable<List<GroceryTileModelData>> bestSellingListenable;

  const BestSellingListView({
    Key? key,
    required this.bestSellingListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<GroceryTileModelData>>(
      valueListenable: bestSellingListenable,
      builder: (context, groceries, child) {
        if (groceries.isNotEmpty) {
          return SizedBox(
            height: 230,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3,
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
