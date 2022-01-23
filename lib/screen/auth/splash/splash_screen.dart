import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

import 'widget/app_slogan.dart';
import 'widget/app_title.dart';
import 'widget/splash_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SplashLogo(),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AppTitle(),
                  AppSlogan(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
