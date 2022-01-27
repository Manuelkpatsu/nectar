import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class CategoryName extends StatelessWidget {
  final String name;

  const CategoryName({ Key? key, required this.name }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        name,
        textAlign: TextAlign.center,
        style: normalStyle.copyWith(
          color: AppColor.mainTextColor,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
