import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/theme/styles.dart';

class PlaceOrderButton extends StatelessWidget {
  final VoidCallback? onPlaceOrderTap;

  const PlaceOrderButton({
    Key? key,
    required this.onPlaceOrderTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppButton(
        widget: const Text('Place Order', style: mediumStyle),
        onPressed: onPlaceOrderTap,
      ),
    );
  }
}
