import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class OrderErrorDialog extends StatelessWidget {
  final VoidCallback? onCloseTap;
  final VoidCallback? onTryAgainTap;
  final VoidCallback? onBackToHomeTap;

  const OrderErrorDialog({
    Key? key,
    required this.onCloseTap,
    required this.onTryAgainTap,
    required this.onBackToHomeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      contentPadding: const EdgeInsets.all(20),
      content: IntrinsicHeight(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: onCloseTap,
                color: AppColor.mainTextColor,
                splashRadius: 20,
              ),
            ),
            Image.asset(
              'assets/images/order-error.png',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Text(
              'Oops! Order failed',
              style: bigStyle.copyWith(fontSize: 28),
            ),
            const SizedBox(height: 10),
            Text(
              'Something went wrong',
              style: normalStyle.copyWith(color: AppColor.mainGreyTextColor),
            ),
            const SizedBox(height: 30),
            AppButton(
              widget: const Text(
                'Please try again',
                style: mediumStyle,
              ),
              onPressed: onTryAgainTap,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: onBackToHomeTap,
              child: Text(
                'Back to home',
                style: mediumStyle.copyWith(color: AppColor.mainTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
