import 'package:flutter/material.dart';

import 'widget/connect_with_social_text.dart';
import 'widget/email_sign_in_button.dart';
import 'widget/facebook_sign_in_button.dart';
import 'widget/google_sign_in_button.dart';
import 'widget/phone_sign_in_button.dart';
import 'widget/sign_in_info_image.dart';
import 'widget/sign_in_info_screen_background.dart';
import 'widget/sign_in_info_title_text.dart';

class SignInInfoScreen extends StatelessWidget {
  const SignInInfoScreen({Key? key}) : super(key: key);

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
                      PhoneSignInButton(onPressed: () {}),
                      const SizedBox(height: 20),
                      EmailSignInButton(onPressed: () {}),
                      const SizedBox(height: 30),
                      const ConnectWithSocialText(),
                      const SizedBox(height: 30),
                      GoogleSignInButton(onPressed: () {}),
                      const SizedBox(height: 20),
                      FacebookSignInButton(onPressed: () {}),
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
