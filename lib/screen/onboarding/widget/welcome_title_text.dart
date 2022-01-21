import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class WelcomeTitleText extends StatelessWidget {
  const WelcomeTitleText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome to our store',
      textAlign: TextAlign.center,
      style: hugeStyle,
    );
  }
}
