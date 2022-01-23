import 'package:flutter/foundation.dart';
import 'package:functional_listener/functional_listener.dart';

import 'enter_number_notifier.dart';

extension ProductIndexListenable on EnterNumberNotifier {
  /// Exposes a [String].
  ///
  /// The country code for displaying the country's image.
  ValueListenable<String> get countryFlagImage => map((m) => m.countryCode);

  /// Exposes a [String].
  ///
  /// The country's dial code to display.
  ValueListenable<String> get countryDialCode => map((m) => m.countryDialCode);
}
