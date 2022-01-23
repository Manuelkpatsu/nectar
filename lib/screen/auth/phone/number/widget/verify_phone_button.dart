import 'package:flutter/material.dart';
import 'package:nectar/screen/auth/phone/widget/circular_button.dart';

class VerifyPhoneButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const VerifyPhoneButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CircularButton(onPressed: onPressed),
    );
  }
}
