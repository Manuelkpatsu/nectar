import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

class ClearSearchQueryButton extends StatelessWidget {
  final void Function()? onPressed;

  const ClearSearchQueryButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.cancel,
        size: 20,
        color: AppColor.iconColor,
      ),
      onPressed: onPressed,
      splashRadius: 20,
    );
  }
}
