import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class CartItemName extends StatelessWidget {
  final String name;

  const CartItemName({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: normalStyle.copyWith(
        color: AppColor.mainTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
