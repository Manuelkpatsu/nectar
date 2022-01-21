import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/logo.dart';

class WelcomeLogo extends Logo {
  const WelcomeLogo({Key? key})
      : super(
          key: key,
          image: 'assets/images/logo-white.png',
          height: 55,
          width: 45,
        );
}
