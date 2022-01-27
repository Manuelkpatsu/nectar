import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/screen/store/home/exclusive/exclusive_tile.dart';
import 'package:nectar/screen/store/home/exclusive/exclusive_tile_model_data.dart';

class ExclusiveListView extends StatelessWidget {
  final ValueListenable<List<ExclusiveTileModelData>>
      exclusiveGroceriesListenable;

  const ExclusiveListView({
    Key? key,
    required this.exclusiveGroceriesListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<ExclusiveTileModelData>>(
      valueListenable: exclusiveGroceriesListenable,
      builder: (context, groceries, child) {
        if (groceries.isNotEmpty) {
          return SizedBox(
            height: 230,
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: 3,
              itemBuilder: (context, index) {
                ExclusiveTileModelData modelData = groceries[index];
          
                return ExclusiveTile(context, modelData);
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
