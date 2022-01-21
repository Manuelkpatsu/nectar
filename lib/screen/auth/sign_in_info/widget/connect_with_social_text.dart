import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class ConnectWithSocialText extends StatelessWidget {
  const ConnectWithSocialText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        'Or connect with social media',
        textAlign: TextAlign.center,
        style: smallStyle.copyWith(
          color: AppColor.greyColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
