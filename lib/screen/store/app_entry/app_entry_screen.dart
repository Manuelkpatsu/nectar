import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:tuple/tuple.dart';

import '../../../locator.dart';
import 'app_entry_event.dart';
import 'app_entry_notifier.dart';
import 'app_entry_listenable.dart';

class AppEntryScreen extends StatefulWidget {
  const AppEntryScreen({ Key? key }) : super(key: key);

  @override
  _AppEntryScreenState createState() => _AppEntryScreenState();
}

class _AppEntryScreenState extends State<AppEntryScreen> {
  final eventController = StreamController<AppEntryEvent>();
  late final AppEntryNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = get<AppEntryNotifier>(param1: context);
    notifier.init(eventController);
  }

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Tuple3<int, List<BottomNavigationBarItem>, List<Widget>>>(
      valueListenable: notifier.page,
      builder: (context, tuple, child) {
        return Scaffold(
          body: IndexedStack(
            index: tuple.item1,
            children: tuple.item3,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: AppColor.mainTextColor,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: tuple.item1,
            onTap: (index) {
              eventController.add(NavBarChangedEvent(index));
            },
            items: tuple.item2,
          ),
        );
      }
    );
  }
}
