import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';

import 'enter_otp_notifier.dart';
import 'package:functional_listener/functional_listener.dart';

extension EnterOTPListenable on EnterOTPNotifier {
  /// Exposes a [Tuple2]<[bool], [int]>.
  ///
  /// [Tuple2.item1] - true if the text should be shown, false otherwise.
  ///
  /// [Tuple2.item2] - the countdown time in seconds.
  ValueListenable<Tuple2<bool, int>> get resendCodeInText =>
      map((m) => Tuple2(m.countDownTimeInSecs > 0, m.countDownTimeInSecs));

  /// Exposes a bool.
  ///
  /// True if the button should be shown, false otherwise.
  ValueListenable<bool> get resendCodeButton =>
      map((m) => m.countDownTimeInSecs < 1);
}
