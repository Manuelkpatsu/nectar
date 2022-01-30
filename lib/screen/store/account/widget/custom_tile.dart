import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class CustomTile extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final IconData icon;

  const CustomTile({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Icon(icon, color: AppColor.mainTextColor),
      title: Text(
        title,
        style: mediumStyle.copyWith(
          color: AppColor.mainTextColor,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColor.mainTextColor,
      ),
    );
  }
}
