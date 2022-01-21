import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class SignInTitleText extends StatelessWidget {
  const SignInTitleText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Login',
      style: bigStyle,
    );
  }
}
