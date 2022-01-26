import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class GroceryPrice extends StatelessWidget {
  final double price;

  const GroceryPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)}',
      style: mediumStyle.copyWith(
        color: AppColor.mainTextColor,
      ),
    );
  }
}
