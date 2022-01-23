import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class SelectCountryText extends StatelessWidget {
  const SelectCountryText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: const Text(
        'Select a country',
        style: bigStyle,
      ),
    );
  }
}
