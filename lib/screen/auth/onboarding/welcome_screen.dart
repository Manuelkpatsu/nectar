import 'package:flutter/material.dart';

import 'widget/get_started_button.dart';
import 'widget/welcome_logo.dart';
import 'widget/welcome_screen_background.dart';
import 'widget/welcome_sub_title_text.dart';
import 'widget/welcome_title_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const WelcomeScreenBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const WelcomeLogo(),
                const SizedBox(height: 20),
                const WelcomeTitleText(),
                const WelcomeSubTitleText(),
                const SizedBox(height: 40),
                GetStartedButton(onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
