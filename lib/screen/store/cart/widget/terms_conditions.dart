import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class TermsConditions extends StatelessWidget {
  final VoidCallback? onTermsTap;
  final VoidCallback? onConditionsTap;

  const TermsConditions({
    Key? key,
    required this.onTermsTap,
    required this.onConditionsTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        text: TextSpan(
          text: 'By placing an order you agree to our ',
          style: smallStyle.copyWith(
            color: AppColor.mainGreyTextColor,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: 'Terms ',
              recognizer: TapGestureRecognizer()..onTap = onTermsTap,
              style: smallStyle.copyWith(color: AppColor.mainTextColor),
            ),
            const TextSpan(
              text: 'and ',
            ),
            TextSpan(
              text: 'Conditions.',
              recognizer: TapGestureRecognizer()..onTap = onConditionsTap,
              style: smallStyle.copyWith(color: AppColor.mainTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
