import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import 'home_event.dart';
import 'home_notifier.dart';
import 'widget/home_banner.dart';
import 'home_listenable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final eventController = StreamController<HomeEvent>();
  late final HomeNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = get<HomeNotifier>(param1: context);
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              HomeBanner(
                bannerListenable: notifier.banner,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  eventController.add(BannerChangedEvent(index));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
