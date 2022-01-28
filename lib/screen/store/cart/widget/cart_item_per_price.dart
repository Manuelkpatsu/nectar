import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class CartItemPerPrice extends StatelessWidget {
  final String perPrice;

  const CartItemPerPrice({Key? key, required this.perPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$perPrice/price',
      style: smallStyle.copyWith(color: AppColor.mainGreyTextColor),
    );
  }
}
