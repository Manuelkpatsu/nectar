import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class AppSlogan extends StatelessWidget {
  const AppSlogan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'online groceries',
      style: smallStyle.copyWith(letterSpacing: 4),
    );
  }
}
