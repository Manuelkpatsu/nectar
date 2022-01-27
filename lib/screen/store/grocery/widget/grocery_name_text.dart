import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class GroceryNameText extends StatelessWidget {
  final String name;
  const GroceryNameText({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        name,
        style: bigStyle.copyWith(
          fontSize: 24,
        ),
      ),
    );
  }
}
