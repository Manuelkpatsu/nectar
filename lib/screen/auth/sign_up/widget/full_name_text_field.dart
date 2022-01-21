import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/text_input_field.dart';
import 'package:nectar/utils/validator.dart';

class FullNameTextField extends TextInputField {
  FullNameTextField({
    Key? key,
    required TextEditingController controller,
  }) : super(
          key: key,
          controller: controller,
          validator: Validator.fullName,
          label: 'Full Name',
          inputAction: TextInputAction.next,
          inputType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
        );
}
