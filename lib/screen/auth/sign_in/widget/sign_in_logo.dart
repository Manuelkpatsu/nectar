import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/logo.dart';

class SignInLogo extends StatelessWidget {
  const SignInLogo({ Key? key }) : super(key: key);

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
