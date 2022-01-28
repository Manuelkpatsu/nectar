import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class CartItemTotalAmount extends StatelessWidget {
  final double totalAmount;

  const CartItemTotalAmount({
    Key? key,
    required this.totalAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${totalAmount.toStringAsFixed(2)}',
      style: mediumStyle.copyWith(color: AppColor.mainTextColor),
    );
  }
}
