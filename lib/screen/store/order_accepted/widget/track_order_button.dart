import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/theme/styles.dart';

class TrackOrderButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const TrackOrderButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      widget: const Text('Track Order', style: mediumStyle),
      onPressed: onPressed,
    );
  }
}
