import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class WelcomeSubTitleText extends StatelessWidget {
  const WelcomeSubTitleText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Get your groceries in as fast as one hour',
      textAlign: TextAlign.center,
      style: normalStyle,
    );
  }
}
