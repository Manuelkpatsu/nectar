import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class FavoriteItemName extends StatelessWidget {
  final String name;

  const FavoriteItemName({
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
