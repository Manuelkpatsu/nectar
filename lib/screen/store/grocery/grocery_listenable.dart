import 'package:flutter/foundation.dart';
import 'package:functional_listener/functional_listener.dart';
import 'package:nectar/model/grocery.dart';

import 'grocery_notifier.dart';

extension GroceryListenable on GroceryNotifier {
  /// The grocery to display
  ValueListenable<Grocery?> get grocery => map((m) => m.grocery);

  // The current image index
  ValueListenable<int> get imageIndex => map((m) => m.currentImageIndex);

  /// The selected quantity to display.
  ValueListenable<int?> get quantity => map((m) => m.selectedQuantity);
}
