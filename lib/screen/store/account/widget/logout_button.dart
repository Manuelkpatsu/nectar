import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_button.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class LogoutButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const LogoutButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      alignment: Alignment.bottomCenter,
      child: AppButton(
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout_outlined),
            const SizedBox(width: 20),
            Text(
              'Logout',
              style: mediumStyle.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
        primary: AppColor.greyBackgroundColor,
        onPrimary: AppColor.primaryColor,
      ),
    );
  }
}
