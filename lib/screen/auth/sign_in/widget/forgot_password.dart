import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class ForgotPassword extends StatelessWidget {
  final void Function()? onTap;

  const ForgotPassword({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: onTap,
        child: Text(
          'Forgot Password?',
          style: smallStyle.copyWith(color: AppColor.primaryColor),
        ),
      ),
    );
  }
}
