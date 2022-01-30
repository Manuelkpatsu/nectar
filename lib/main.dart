import 'package:flutter/material.dart';

import 'locator.dart';
import 'screen/auth/splash/splash_screen.dart';
import 'theme/app_theme.dart';

void main() {
  setUpLocator();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
