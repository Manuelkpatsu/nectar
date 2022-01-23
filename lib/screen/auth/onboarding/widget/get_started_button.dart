import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/theme/styles.dart';

class GetStartedButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const GetStartedButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: onPressed,
      widget: const Text(
        'Get Started',
        style: mediumStyle,
      ),
    );
  }
}
