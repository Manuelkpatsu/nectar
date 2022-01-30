import 'dart:async';

import 'package:flutter/material.dart';

import '../../../locator.dart';
import 'welcome_event.dart';
import 'welcome_notifier.dart';
import 'widget/get_started_button.dart';
import 'widget/welcome_logo.dart';
import 'widget/welcome_screen_background.dart';
import 'widget/welcome_sub_title_text.dart';
import 'widget/welcome_title_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final eventController = StreamController<WelcomeEvent>();
  late final WelcomeNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = get<WelcomeNotifier>(param1: context);
    notifier.init(eventController);
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

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
                GetStartedButton(onPressed: () {
                  eventController.add(GoToSignInInfoScreenEvent());
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
