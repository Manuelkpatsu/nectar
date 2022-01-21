import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final VoidCallback? toggle;
  final String label;

  const PasswordInputField({
    Key? key,
    required this.controller,
    required this.label,
    this.inputType,
    this.inputAction,
    this.validator,
    this.obscureText,
    this.toggle,
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
        suffixIcon: IconButton(
          color: AppColor.mainGreyTextColor,
          icon: obscureText!
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: toggle,
        ),
      ),
      keyboardType: inputType,
      textInputAction: inputAction,
      obscureText: obscureText!,
      validator: validator,
      style: mediumStyle.copyWith(
        fontWeight: FontWeight.normal,
        color: AppColor.mainTextColor,
      ),
    );
  }
}
