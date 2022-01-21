import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget widget;
  final Color? primary;
  final Color? onPrimary;

  const AppButton({
    Key? key,
    required this.widget,
    required this.onPressed,
    this.primary,
    this.onPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: widget,
      style: ElevatedButton.styleFrom(
        primary: primary,
        onPrimary: onPrimary,
      ),
    );
  }
}
