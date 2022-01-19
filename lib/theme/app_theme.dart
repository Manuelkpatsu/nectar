import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColor.primaryColor,
      fontFamily: 'Gilroy',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      primarySwatch: AppColor.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: AppColor.primaryColor,
          elevation: 0,
          onPrimary: AppColor.buttonTextColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(19)),
          ),
          minimumSize: const Size(double.infinity, 50), 
        ),
      ),
    );
  }
}
