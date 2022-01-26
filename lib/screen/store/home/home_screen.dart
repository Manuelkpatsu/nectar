import 'dart:async';

import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import 'home_event.dart';
import 'home_notifier.dart';
import 'widget/best_selling_header.dart';
import 'widget/best_selling_list_view.dart';
import 'widget/exclusive_header.dart';
import 'widget/exclusive_list_view.dart';
import 'widget/groceries_header.dart';
import 'widget/groceries_list_view.dart';
import 'widget/home_banner.dart';
import 'home_listenable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              HomeBanner(
                bannerListenable: notifier.banner,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  eventController.add(BannerChangedEvent(index));
                },
              ),
              const SizedBox(height: 30),
              ExclusiveHeader(onPressed: () {
                eventController.add(SeeExclusiveOfferEvent(true));
              }),
              const SizedBox(height: 20),
              ExclusiveListView(
                exclusiveGroceriesListenable: notifier.exclusiveGroceries,
              ),
              const SizedBox(height: 20),
              BestSellingHeader(onPressed: () {
                eventController.add(SeeBestSellingEvent(true));
              }),
              const SizedBox(height: 20),
              BestSellingListView(
                bestSellingListenable: notifier.bestSellingGroceries,
              ),
              const SizedBox(height: 20),
              GroceriesHeader(onPressed: () {
                eventController.add(SeeAllGroceriesEvent());
              }),
              const SizedBox(height: 20),
              GroceriesListView(groceriesListenable: notifier.groceries),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
