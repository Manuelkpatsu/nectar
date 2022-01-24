import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class EnterOTPSubTitleText extends StatelessWidget {
  final String phoneNumber;
  const EnterOTPSubTitleText({ Key? key, required this.phoneNumber, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Enter the 6-digit code sent to you on $phoneNumber',
      maxLines: 2,
      style: normalStyle.copyWith(
        color: AppColor.mainGreyTextColor,
        fontSize: 15,
      ),
    );
  }
}
