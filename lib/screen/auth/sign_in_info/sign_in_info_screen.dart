import 'dart:async';

import 'package:flutter/material.dart';

import '../../../locator.dart';
import 'sign_in_info_event.dart';
import 'sign_in_info_notifier.dart';
import 'widget/connect_with_social_text.dart';
import 'widget/email_sign_in_button.dart';
import 'widget/facebook_sign_in_button.dart';
import 'widget/google_sign_in_button.dart';
import 'widget/phone_sign_in_button.dart';
import 'widget/sign_in_info_image.dart';
import 'widget/sign_in_info_screen_background.dart';
import 'widget/sign_in_info_title_text.dart';

class SignInInfoScreen extends StatefulWidget {
  const SignInInfoScreen({Key? key}) : super(key: key);

  @override
  State<SignInInfoScreen> createState() => _SignInInfoScreenState();
}

class _SignInInfoScreenState extends State<SignInInfoScreen> {
  final eventController = StreamController<SignInInfoEvent>();
  late final SignInInfoNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = get<SignInInfoNotifier>(param1: context);
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
          const SignInInfoScreenBackground(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SignInInfoImage(),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SignInInfoTitleText(),
                      const SizedBox(height: 30),
                      PhoneSignInButton(onPressed: () {
                        eventController.add(PhoneSignInEvent());
                      }),
                      const SizedBox(height: 20),
                      EmailSignInButton(onPressed: () {
                        eventController.add(EmailSignInEvent());
                      }),
                      const SizedBox(height: 30),
                      const ConnectWithSocialText(),
                      const SizedBox(height: 30),
                      GoogleSignInButton(onPressed: () {
                        eventController.add(GoogleSignInEvent());
                      }),
                      const SizedBox(height: 20),
                      FacebookSignInButton(onPressed: () {
                        eventController.add(FacebookSignInEvent());
                      }),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
