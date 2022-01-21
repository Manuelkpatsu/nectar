import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class SignUpSubTitleText extends StatelessWidget {
  const SignUpSubTitleText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Enter your credentials to continue',
      style: normalStyle.copyWith(
        color: AppColor.mainGreyTextColor,
        fontWeight: FontWeight.normal,
      )
    );
  }
}
