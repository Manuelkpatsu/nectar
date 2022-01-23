import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('nectar', style: hugeStyle);
  }
}
