import 'package:flutter/foundation.dart';
import 'package:functional_listener/functional_listener.dart';

import 'account_notifier.dart';

extension AccountListenable on AccountNotifier {
  /// The profile photo to display.
  ValueListenable<String?> get photo => map((m) => m.image);

  /// The full name to display.
  ValueListenable<String?> get fullName => map((m) => m.name);

  /// The email to display.
  ValueListenable<String?> get email => map((m) => m.email);
}
