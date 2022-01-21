import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class PhoneSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const PhoneSignInButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      primary: AppColor.redColor,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.phone_android_outlined,
            size: 24,
          ),
          SizedBox(width: 20),
          Text(
            'Sign in with Phone',
            style: mediumStyle,
          ),
        ],
      ),
    );
  }
}
