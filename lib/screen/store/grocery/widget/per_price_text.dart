import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class PerPriceText extends StatelessWidget {
  final String perPrice;

  const PerPriceText({ Key? key, required this.perPrice }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        '$perPrice/price',
        style: normalStyle.copyWith(
          color: AppColor.mainGreyTextColor,
        ),
      ),
    );
  }
}
