import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:functional_listener/functional_listener.dart';
import 'package:nectar/screen/store/grcoery_tile/grocery_tile_model_data.dart';
import 'package:tuple/tuple.dart';

import 'home_notifier.dart';

extension HomeListenable on HomeNotifier {
  /// The current banner index
  ///
  /// [Tuple2.item1] - the current banner index
  /// [Tuple2.item2] - list of banner items
  ValueListenable<Tuple2<int, List<Widget>>> get banner => map(
        (m) => Tuple2(m.currentBannerIndex, m.bannerItems),
      );

  /// The list of best selling groceries to display
  ValueListenable<List<GroceryTileModelData>> get bestSellingGroceries =>
      map((m) => m.bestSellingGroceries);

  /// The list of exclusive groceries to display
  ValueListenable<List<GroceryTileModelData>> get exclusiveGroceries =>
      map((m) => m.exclusiveGroceries);

  /// The list of all groceries to display
  ValueListenable<List<GroceryTileModelData>> get groceries =>
      map((m) => m.groceries);
}
