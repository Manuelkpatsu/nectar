import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class ResendCodeButton extends StatelessWidget {
  final ValueListenable<bool> resendCodeListenable;
  final VoidCallback? onTap;

  const ResendCodeButton({
    Key? key,
    required this.resendCodeListenable,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: resendCodeListenable,
      child: Text(
        'Resend Code',
        style: mediumStyle.copyWith(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      ),
      builder: (context, showButton, child) {
        return Visibility(
          visible: showButton,
          child: InkWell(onTap: onTap, child: child),
        );
      },
    );
  }
}
