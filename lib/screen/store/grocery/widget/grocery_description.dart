import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class GroceryDescription extends StatelessWidget {
  final String description;

  const GroceryDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: AppColor.mainTextColor,
      initiallyExpanded: true,
      collapsedIconColor: AppColor.mainTextColor,
      childrenPadding: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
      title: Text(
        'Product Detail',
        style: normalStyle.copyWith(
          color: AppColor.mainTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: [
        Text(
          description,
          style: smallStyle.copyWith(
            color: AppColor.mainGreyTextColor,
          ),
        )
      ],
    );
  }
}
