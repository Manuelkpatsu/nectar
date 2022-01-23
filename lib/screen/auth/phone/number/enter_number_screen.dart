import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../locator.dart';
import 'enter_number_event.dart';
import 'enter_number_notifier.dart';
import 'widget/country_picker_phone_number.dart';
import 'widget/enter_number_screen_background.dart';
import 'widget/enter_number_title_text.dart';
import 'enter_number_listenable.dart';
import 'widget/verify_phone_button.dart';

class EnterNumberScreen extends StatefulWidget {
  const EnterNumberScreen({Key? key}) : super(key: key);

  @override
  _EnterNumberScreenState createState() => _EnterNumberScreenState();
}

class _EnterNumberScreenState extends State<EnterNumberScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  final eventController = StreamController<EnterNumberEvent>();
  late final EnterNumberNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = get<EnterNumberNotifier>(param1: context);
    notifier.init(eventController);
  }

  @override
  void dispose() {
    notifier.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const EnterNumberScreenBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const EnterNumberTitleText(),
                  const SizedBox(height: 30),
                  CountryPickerPhoneNumber(
                    controller: phoneNumberController,
                    countryDialCodeListenable: notifier.countryDialCode,
                    countryFlagListenable: notifier.countryFlagImage,
                    onTap: () =>
                        eventController.add(GoToSelectCountryScreenEvent()),
                  ),
                  const SizedBox(height: 100),
                  VerifyPhoneButton(onPressed: () {
                    eventController.add(VerifyPhoneNumberEvent(
                      phoneNumberController.text.trim(),
                    ));
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
