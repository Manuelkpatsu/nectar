import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';
import 'package:tuple/tuple.dart';

class ResendCodeInText extends StatelessWidget {
  final ValueListenable<Tuple2<bool, int>> resendCodeInTextListenable;

  const ResendCodeInText({
    Key? key,
    required this.resendCodeInTextListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Tuple2<bool, int>>(
      valueListenable: resendCodeInTextListenable,
      builder: (context, tuple, child) {
        return Visibility(
          visible: tuple.item1,
          child: Text(
            'Resend code in 0:${tuple.item2.toString().padLeft(2, '0')}',
            style: mediumStyle.copyWith(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        );
      },
    );
  }
}
