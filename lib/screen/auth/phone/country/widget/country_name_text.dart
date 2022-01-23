import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class CountryNameText extends StatelessWidget {
  final String name;

  const CountryNameText({ Key? key, required this.name, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: mediumStyle.copyWith(
        color: AppColor.mainTextColor,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
