import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/background_image.dart';

class WelcomeScreenBackground extends BackgroundImage {
  const WelcomeScreenBackground({Key? key})
      : super(
          key: key,
          image: 'assets/images/welcome.png',
          colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.softLight),
        );
}
