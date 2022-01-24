import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class EnterOTPTitleText extends StatelessWidget {
  const EnterOTPTitleText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Verify your phone number',
      style: bigStyle,
    );
  }
}
