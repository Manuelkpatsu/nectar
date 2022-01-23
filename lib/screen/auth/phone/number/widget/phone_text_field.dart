import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController? controller;

  const PhoneTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        cursorColor: AppColor.primaryColor,
        style: mediumStyle.copyWith(
          color: AppColor.mainTextColor,
        ),
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.phone,
        autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Mobile Number',
          hintStyle: normalStyle.copyWith(
            color: AppColor.mainGreyTextColor
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 13),
        ),
      ),
    );
  }
}
