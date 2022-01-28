import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

class AppDivider extends StatelessWidget {
  final EdgeInsets padding;
  final Color color;

  const AppDivider({
    Key? key,
    this.padding = EdgeInsets.zero,
    this.color = AppColor.dividerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Divider(
        height: 0,
        color: color,
      ),
    );
  }
}
