import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/theme/styles.dart';

class EmailSignInButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const EmailSignInButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.email_outlined,
            size: 24,
          ),
          SizedBox(width: 20),
          Text(
            'Sign in with Email',
            style: mediumStyle,
          ),
        ],
      ),
    );
  }
}
