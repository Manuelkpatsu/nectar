import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

class AppDivider extends StatelessWidget {
  final EdgeInsets padding;
  const AppDivider({
    Key? key,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: const Divider(
        height: 0,
        color: AppColor.dividerColor,
      ),
    );
  }
}
