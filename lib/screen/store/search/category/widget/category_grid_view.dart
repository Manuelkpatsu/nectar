import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

import '../category_tile.dart';
import '../category_tile_model_data.dart';

class CategoryGridView extends StatelessWidget {
  final ValueListenable<List<CategoryTileModelData>> categoriesListenable;

  const CategoryGridView({
    Key? key,
    required this.categoriesListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<CategoryTileModelData>>(
      valueListenable: categoriesListenable,
      builder: (context, categories, child) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.95,
          ),
          itemCount: categories.length,
          itemBuilder: (context, int index) {
            CategoryTileModelData modelData = categories[index];
            return CategoryTile(
              context,
              modelData,
              AppColor.colors[index]
            );
          },
        );
      }
    );
  }
}
