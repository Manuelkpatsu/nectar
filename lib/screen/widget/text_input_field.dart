import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final String label;

  const TextInputField({
    Key? key,
    required this.controller,
    required this.label,
    this.inputType,
    this.inputAction,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.primaryColor,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: normalStyle.copyWith(
          color: AppColor.mainGreyTextColor,
          fontWeight: FontWeight.w600,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.textFieldBorderColor, width: 1),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.textFieldBorderColor, width: 1),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.textFieldBorderColor, width: 1),
        ),
      ),
      keyboardType: inputType,
      textInputAction: inputAction,
      validator: validator,
      textCapitalization: textCapitalization,
      style: mediumStyle.copyWith(
        fontWeight: FontWeight.normal,
        color: AppColor.mainTextColor,
      )
    );
  }
}
