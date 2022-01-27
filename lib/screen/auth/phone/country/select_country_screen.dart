import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../locator.dart';
import 'select_country_event.dart';
import 'select_country_notifier.dart';
import 'widget/country_list.dart';
import '../../../store/widget/search_text_field.dart';
import 'widget/select_country_text.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  _SelectCountryScreenState createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  final TextEditingController searchTextEditingController =
      TextEditingController();
  late final SelectCountryNotifier notifier;
  final eventController = StreamController<SelectCountryEvent>();

  @override
  void initState() {
    super.initState();
    notifier = get<SelectCountryNotifier>(param1: context);
    notifier.init(eventController);
  }

  @override
  void dispose() {
    notifier.dispose();
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SelectCountryText(),
          SearchTextField(
            controller: searchTextEditingController,
            hintText: 'Search for a country',
            onPressed: () {
              if (searchTextEditingController.text.isNotEmpty) {
                searchTextEditingController.clear();
                eventController.add(ClearSearchQueryEvent());
              }
            },
            onChanged: (String searchQuery) {
              eventController.add(SearchCountryEvent(searchQuery));
            },
          ),
          CountryList(countriesListenable: notifier)
        ],
      ),
    );
  }
}
