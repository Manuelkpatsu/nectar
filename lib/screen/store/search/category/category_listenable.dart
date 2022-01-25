import 'package:flutter/foundation.dart';
import 'package:functional_listener/functional_listener.dart';

import 'category_notifier.dart';
import 'category_tile_model_data.dart';

extension CategoryListenable on CategoryNotifier {
  /// The list of categories to display
  ValueListenable<List<CategoryTileModelData>> get categories =>
      map((m) => m.categories);
}
