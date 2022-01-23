import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class CountryDialCodeText extends StatelessWidget {
  final String countryCode;
  
  const CountryDialCodeText({
    Key? key,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      countryCode,
      style: mediumStyle.copyWith(
        color: AppColor.mainTextColor,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
