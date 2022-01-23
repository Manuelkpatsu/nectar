import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class DialCodeText extends StatelessWidget {
  final ValueListenable<String> countryDialCodeListenable;
  
  const DialCodeText({
    Key? key,
    required this.countryDialCodeListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: countryDialCodeListenable,
      builder: (context, countryDialCode, child) {
        return Text(
          countryDialCode,
          style: mediumStyle.copyWith(
            color: AppColor.mainTextColor,
          ),
        );
      }
    );
  }
}
