import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class Promo extends StatelessWidget {
  final VoidCallback? onPromoCodeTap;

  const Promo({
    Key? key,
    required this.onPromoCodeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPromoCodeTap,
      title: Text(
        'Promo Code',
        style: mediumStyle.copyWith(
          color: AppColor.mainGreyTextColor,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Pick Discount',
            style: normalStyle.copyWith(
              color: AppColor.mainTextColor,
            ),
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
