import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class EnterNumberTitleText extends StatelessWidget {
  const EnterNumberTitleText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Enter your mobile number',
      style: bigStyle,
    );
  }
}
