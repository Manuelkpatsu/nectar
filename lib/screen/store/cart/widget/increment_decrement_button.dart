import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

class IncrementDecrementButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final Color color;

  const IncrementDecrementButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      child: Icon(
        icon,
        size: 30,
        color: color,
      ),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
        side: const BorderSide(width: 1, color: AppColor.quantityColor),
      ),
    );
  }
}
