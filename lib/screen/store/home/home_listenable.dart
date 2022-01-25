import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:functional_listener/functional_listener.dart';
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
}
