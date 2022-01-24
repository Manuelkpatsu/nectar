import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class OTPTextField extends StatelessWidget {
  final TextEditingController controller;

  const OTPTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      cursorColor: AppColor.primaryColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      style: normalStyle.copyWith(
        color: AppColor.mainTextColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 5,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: AppColor.greyBackgroundColor,
        hintText: 'Enter the OTP code',
        hintStyle: normalStyle.copyWith(
          color: AppColor.mainGreyTextColor,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      ),
      inputFormatters: [LengthLimitingTextInputFormatter(6)],
    );
  }
}
