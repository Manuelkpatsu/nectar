import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class SignInSubTitleText extends StatelessWidget {
  const SignInSubTitleText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Enter your email and password',
      style: normalStyle.copyWith(
        color: AppColor.mainGreyTextColor,
        fontWeight: FontWeight.normal,
      )
    );
  }
}
