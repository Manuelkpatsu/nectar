import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class OrderAcceptedSubTitle extends StatelessWidget {
  const OrderAcceptedSubTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Your items have been placed and is on it's way to being processed.",
      textAlign: TextAlign.center,
      style: normalStyle.copyWith(
        color: AppColor.mainGreyTextColor
      ),
    );
  }
}
