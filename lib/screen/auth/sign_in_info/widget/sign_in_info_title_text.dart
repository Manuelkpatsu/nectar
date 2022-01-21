import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class SignInInfoTitleText extends StatelessWidget {
  const SignInInfoTitleText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Get your groceries\nwith nectar',
      style: bigStyle,
    );
  }
}
