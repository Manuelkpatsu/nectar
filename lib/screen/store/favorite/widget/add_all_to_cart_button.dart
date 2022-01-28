import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/theme/styles.dart';

class AddAllToCartButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AddAllToCartButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppButton(
        widget: const Text(
          'Add all to cart',
          style: mediumStyle,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
