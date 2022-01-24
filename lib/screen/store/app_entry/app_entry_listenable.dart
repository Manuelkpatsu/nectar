import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'app_entry_notifier.dart';
import 'package:functional_listener/functional_listener.dart';

extension AppEntryListenable on AppEntryNotifier {
  /// The current page number
  ///
  /// [Tuple2.item1] - the current page index
  /// [Tuple2.item2] - list of BottomNavigationBarItems
  /// [Tuple3.item3] - list of screens
  ValueListenable<Tuple3<int, List<BottomNavigationBarItem>, List<Widget>>>
      get page => map(
            (m) => Tuple3(m.currentPageIndex, m.navBarItems, m.screens),
          );
}
