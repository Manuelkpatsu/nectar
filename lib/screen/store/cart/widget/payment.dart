import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class Payment extends StatelessWidget {
  final VoidCallback? onPaymentTap;

  const Payment({
    Key? key,
    required this.onPaymentTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPaymentTap,
      title: Text(
        'Payment',
        style: mediumStyle.copyWith(
          color: AppColor.mainGreyTextColor,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/card.png',
            height: 16,
            width: 20,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          const Icon(
            Icons.chevron_right,
            color: AppColor.mainTextColor,
          ),
        ],
      ),
    );
  }
}
