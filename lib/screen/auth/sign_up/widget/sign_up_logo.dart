import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/logo.dart';

class SignUpLogo extends StatelessWidget {
  const SignUpLogo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: Logo(
        image: 'assets/images/logo.png',
        height: 55,
        width: 45,
      ),
    );
  }
}
