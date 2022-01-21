import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/password_input_field.dart';
import 'package:nectar/utils/validator.dart';

class RegisterPasswordTextField extends PasswordInputField {
  RegisterPasswordTextField({
    Key? key,
    required TextEditingController controller,
    required bool? obscureText,
    required VoidCallback? toggle,
  }) : super(
          key: key,
          controller: controller,
          validator: Validator.password,
          label: 'Password',
          inputAction: TextInputAction.done,
          obscureText: obscureText,
          toggle: toggle,
        );
}
