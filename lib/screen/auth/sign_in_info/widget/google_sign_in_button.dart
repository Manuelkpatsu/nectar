import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/screen/widget/logo.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class GoogleSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const GoogleSignInButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      primary: AppColor.googleColor,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Logo(
            image: 'assets/images/google.png',
            height: 24,
            width: 22,
          ),
          SizedBox(width: 20),
          Text(
            'Continue with Google',
            style: mediumStyle,
          ),
        ],
      ),
    );
  }
}
