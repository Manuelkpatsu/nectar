import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class TermsPolicy extends StatelessWidget {
  final void Function()? onTapTerms;
  final void Function()? onTapPolicy;

  const TermsPolicy({
    Key? key,
    required this.onTapPolicy,
    required this.onTapTerms,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'By continuing you agree to our ',
        style: smallStyle.copyWith(
          color: AppColor.mainGreyTextColor,
        ),
        children: [
          TextSpan(
            text: 'Terms of Service ',
            recognizer: TapGestureRecognizer()..onTap = onTapTerms,
            style: smallStyle.copyWith(color: AppColor.primaryColor),
          ),
          const TextSpan(
            text: 'and ',
          ),
          TextSpan(
            text: 'Privacy Policy.',
            recognizer: TapGestureRecognizer()..onTap = onTapPolicy,
            style: smallStyle.copyWith(color: AppColor.primaryColor),
          ),
        ],
      ),
    );
  }
}
