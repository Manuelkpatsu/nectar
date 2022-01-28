import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class GoToCheckoutButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double total;

  const GoToCheckoutButton({
    Key? key,
    required this.onPressed,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppButton(
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Go to Checkout',
              style: mediumStyle,
            ),
            const SizedBox(width: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xff489e67),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '\$${total.toStringAsFixed(2)}',
                style: smallStyle.copyWith(color: AppColor.buttonTextColor),
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      ),
    );
  }
}
