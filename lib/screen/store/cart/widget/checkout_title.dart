import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class CheckoutTitle extends StatelessWidget {
  final VoidCallback? onCloseCheckout;

  const CheckoutTitle({
    Key? key,
    required this.onCloseCheckout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Checkout',
            style: bigStyle.copyWith(
              fontSize: 24,
              color: AppColor.mainTextColor,
            ),
          ),
          IconButton(
            onPressed: onCloseCheckout,
            icon: const Icon(Icons.close),
            splashRadius: 20,
          )
        ],
      ),
    );
  }
}
