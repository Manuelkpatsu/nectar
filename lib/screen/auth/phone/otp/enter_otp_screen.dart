import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/screen/auth/phone/widget/circular_button.dart';

import '../../../../locator.dart';
import 'enter_otp_argument.dart';
import 'enter_otp_event.dart';
import 'enter_otp_notifier.dart';
import 'widget/enter_otp_screen_background.dart';
import 'widget/enter_otp_sub_title_text.dart';
import 'widget/enter_otp_title_text.dart';
import 'widget/otp_text_field.dart';
import 'widget/resend_code_button.dart';
import 'enter_otp_listenable.dart';
import 'widget/resend_code_in_text.dart';

class EnterOTPScreen extends StatefulWidget {
  final EnterOTPArgument argument;

  const EnterOTPScreen(this.argument, {Key? key}) : super(key: key);

  @override
  _EnterOTPScreenState createState() => _EnterOTPScreenState();
}

class _EnterOTPScreenState extends State<EnterOTPScreen> {
  late final EnterOTPNotifier notifier;
  final eventController = StreamController<EnterOTPEvent>();
  final TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    notifier = get<EnterOTPNotifier>(param1: context);
    notifier.init(eventController);
    super.initState();
  }

  @override
  void dispose() {
    notifier.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const EnterOTPScreenBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const EnterOTPTitleText(),
                  const SizedBox(height: 10),
                  EnterOTPSubTitleText(
                    phoneNumber: widget.argument.phoneNumber,
                  ),
                  const SizedBox(height: 30),
                  OTPTextField(controller: otpController),
                  const SizedBox(height: 60),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: <Widget>[
                          ResendCodeButton(
                            resendCodeListenable: notifier.resendCodeButton,
                            onTap: () => eventController.add(ResendCodeEvent()),
                          ),
                          ResendCodeInText(
                            resendCodeInTextListenable:
                                notifier.resendCodeInText,
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      CircularButton(onPressed: () {
                        eventController.add(
                            SignInWithSMSCodeEvent(otpController.text.trim()));
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
