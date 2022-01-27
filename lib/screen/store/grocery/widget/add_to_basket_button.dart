import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';

class AddToBasketButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AddToBasketButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppButton(
        widget: const Text('Add to Basket'),
        onPressed: onPressed,
      ),
    );
  }
}
