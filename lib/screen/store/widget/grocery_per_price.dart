import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class GroceryPerPrice extends StatelessWidget {
  final String perPrice;

  const GroceryPerPrice({
    Key? key,
    required this.perPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      perPrice,
      style: smallStyle.copyWith(
        color: AppColor.mainGreyTextColor,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
