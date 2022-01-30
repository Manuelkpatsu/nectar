import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

import '../../../locator.dart';
import 'splash_notifier.dart';
import 'widget/app_slogan.dart';
import 'widget/app_title.dart';
import 'widget/splash_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = get<SplashNotifier>(param1: context);
    notifier.init();
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

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
