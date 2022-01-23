import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'dial_code_text.dart';
import 'phone_text_field.dart';

class CodePhoneNumber extends StatelessWidget {
  final TextEditingController? controller;
  final ValueListenable<String> countryDialCodeListenable;

  const CodePhoneNumber({
    Key? key,
    required this.controller,
    required this.countryDialCodeListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DialCodeText(countryDialCodeListenable: countryDialCodeListenable),
            const SizedBox(width: 5),
            PhoneTextField(controller: controller),
          ],
        ),
      ),
    );
  }
}
