import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/screen/store/order_accepted/widget/order_accepted_background.dart';
import 'package:nectar/screen/store/order_accepted/widget/order_accepted_image.dart';
import 'package:nectar/screen/store/order_accepted/widget/order_accepted_sub_title.dart';
import 'package:nectar/screen/store/order_accepted/widget/order_accepted_text.dart';
import 'package:nectar/screen/store/order_accepted/widget/track_order_button.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

import '../../../locator.dart';
import 'order_accepted_event.dart';
import 'order_accepted_notifier.dart';

class OrderAcceptedScreen extends StatefulWidget {
  const OrderAcceptedScreen({ Key? key }) : super(key: key);

  @override
  State<OrderAcceptedScreen> createState() => _OrderAcceptedScreenState();
}

class _OrderAcceptedScreenState extends State<OrderAcceptedScreen> {
  final eventController = StreamController<OrderAcceptedEvent>();
  late final OrderAcceptedNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = get<OrderAcceptedNotifier>(param1: context);
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
          const OrderAcceptedBackground(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const OrderAccpetedImage(),
                  const SizedBox(height: 30),
                  const OrderAcceptedText(),
                  const SizedBox(height: 10),
                  const OrderAcceptedSubTitle(),
                  const SizedBox(height: 50),
                  TrackOrderButton(onPressed: () {
                    eventController.add(TrackOrderEvent());
                  }),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      eventController.add(BackToHomeEvent());
                    },
                    child: Text(
                      'Back to home',
                      style: mediumStyle.copyWith(
                        color: AppColor.mainTextColor
                      ),
                    )
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
