import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/text_input_field.dart';
import 'package:nectar/utils/validator.dart';

class EmailTextField extends TextInputField {
  EmailTextField({
    Key? key,
    required TextEditingController controller,
  }) : super(
          key: key,
          controller: controller,
          validator: Validator.email,
          label: 'Email',
          inputAction: TextInputAction.next,
          inputType: TextInputType.emailAddress,
        );
}
