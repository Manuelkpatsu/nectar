import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:functional_listener/functional_listener.dart';
import 'package:tuple/tuple.dart';

import 'best_selling/best_selling_tile_model_data.dart';
import 'exclusive/exclusive_tile_model_data.dart';
import 'groceries/groceries_tile_model_data.dart';
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
  ValueListenable<List<BestSellingTileModelData>> get bestSellingGroceries =>
      map((m) => m.bestSellingGroceries);

  /// The list of exclusive groceries to display
  ValueListenable<List<ExclusiveTileModelData>> get exclusiveGroceries =>
      map((m) => m.exclusiveGroceries);

  /// The list of all groceries to display
  ValueListenable<List<GroceriesTileModelData>> get groceries =>
      map((m) => m.groceries);
}
