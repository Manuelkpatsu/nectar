import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

import 'code_phone_number.dart';
import 'country_picker_button.dart';

class CountryPickerPhoneNumber extends StatelessWidget {
  final GestureTapCallback? onTap;
  final ValueListenable<String> countryFlagListenable;
  final ValueListenable<String> countryDialCodeListenable;
  final TextEditingController? controller;

  const CountryPickerPhoneNumber({
    Key? key,
    required this.onTap,
    required this.countryFlagListenable,
    required this.controller,
    required this.countryDialCodeListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColor.textFieldBorderColor, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CountryPickerButton(
            onTap: onTap,
            countryFlagListenable: countryFlagListenable,
          ),
          CodePhoneNumber(
            controller: controller,
            countryDialCodeListenable: countryDialCodeListenable,
          ),
        ],
      ),
    );
  }
}
