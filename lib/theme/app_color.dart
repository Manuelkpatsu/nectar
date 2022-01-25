import 'package:flutter/material.dart';

class AppColor {
  static const MaterialColor white = MaterialColor(
    0xffffffff,
    <int, Color>{
      50: Color(0xffe6e6e6),
      100: Color(0xffcccccc),
      200: Color(0xffb3b3b3),
      300: Color(0xff999999),
      400: Color(0xff808080),
      500: Color(0xff666666),
      600: Color(0xff4c4c4c),
      700: Color(0xff333333),
      800: Color(0xff191919),
      900: Color(0xff000000),
    },
  );

  static const Color primaryColor = Color(0xff53b175);
  static const Color lightPrimaryColor = Color.fromRGBO(83, 177, 117, 0.1);
  static const Color orangeColor = Color.fromRGBO(248, 164, 76, 0.1);
  static const Color brownColor = Color.fromRGBO(247, 165, 147, 0.25);
  static const Color mauveColor = Color.fromRGBO(211, 176, 224, 0.25);
  static const Color yellowColor = Color.fromRGBO(253, 229, 152, 0.25);
  static const Color lightBlueColor = Color.fromRGBO(183, 223, 245, 0.25);
  static const Color violetColor = Color.fromRGBO(131, 106, 246, 0.15);
  static const Color pinkColor = Color.fromRGBO(215, 59, 119, 0.15);
  static const Color googleColor = Color(0xff5383ec);
  static const Color facebookColor = Color(0xff4a66ac);
  static const Color textColor = Color(0xff030303);
  static const Color mainTextColor = Color(0xff181725);
  static const Color greyColor = Color(0xff828282);
  static const Color mainGreyTextColor = Color(0xff7c7c7c);
  static const Color checkBoxStrokeColor = Color(0xffb1b1b1);
  static const Color greyBackgroundColor = Color(0xfff2f3f2);
  static const Color textFieldBorderColor = Color(0xffe2e2e2);
  static const Color lightWhiteColorWithOpacity = Color.fromRGBO(252, 252, 252, 0.7);
  static const Color lightWhiteColor = Color(0xfffcfcfc);
  static const Color buttonTextColor = Color(0xfffff9ff);
  static const Color redColor = Color(0xfff3603f);
  static const Color iconColor = Color(0xff181b19);

  static const List<Color> colors = [
    lightPrimaryColor,
    orangeColor,
    brownColor,
    mauveColor,
    yellowColor,
    lightBlueColor
  ];
}
