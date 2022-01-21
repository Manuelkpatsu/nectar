import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/screen/widget/logo.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class FacebookSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const FacebookSignInButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      primary: AppColor.facebookColor,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Logo(
            image: 'assets/images/facebook.png',
            height: 24,
            width: 12,
          ),
          SizedBox(width: 20),
          Text(
            'Continue with Facebook',
            style: mediumStyle,
          ),
        ],
      ),
    );
  }
}
