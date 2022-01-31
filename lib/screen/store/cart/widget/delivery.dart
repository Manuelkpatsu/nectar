import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class Delivery extends StatelessWidget {
  final VoidCallback? onDeliveryTap;

  const Delivery({
    Key? key,
    required this.onDeliveryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onDeliveryTap,
      title: Text(
        'Delivery',
        style: mediumStyle.copyWith(
          color: AppColor.mainGreyTextColor,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Select Method',
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
