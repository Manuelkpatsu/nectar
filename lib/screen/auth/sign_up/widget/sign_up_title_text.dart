import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class SignUpTitleText extends StatelessWidget {
  const SignUpTitleText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Sign Up',
      style: bigStyle,
    );
  }
}
