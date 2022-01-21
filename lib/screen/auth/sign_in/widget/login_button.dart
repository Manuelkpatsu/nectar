import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/theme/styles.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const LoginButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      widget: const Text(
        'Login',
        style: mediumStyle,
      ),
    );
  }
}
