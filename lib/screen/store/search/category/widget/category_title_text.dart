import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class CategoryTitleText extends StatelessWidget {
  const CategoryTitleText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Category',
      style: mediumStyle.copyWith(
        color: AppColor.mainTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
