import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class CreateNewAccount extends StatelessWidget {
  final void Function()? onTap;

  const CreateNewAccount({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Don\'t have an account? ',
          style: smallStyle.copyWith(
            color: AppColor.textColor,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: 'Sign up',
              style: smallStyle.copyWith(color: AppColor.primaryColor),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
