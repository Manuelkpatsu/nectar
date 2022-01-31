import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class TotalCost extends StatelessWidget {
  const TotalCost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Total Cost',
        style: mediumStyle.copyWith(
          color: AppColor.mainGreyTextColor,
        ),
      ),
      trailing: Text(
        '\$${39.84.toStringAsFixed(2)}',
        style: normalStyle.copyWith(
          color: AppColor.mainTextColor,
        ),
      ),
    );
  }
}
