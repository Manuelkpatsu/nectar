import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/screen/store/widget/search_text_field.dart';

import '../../../../locator.dart';
import 'grocery_search_arguments.dart';
import 'grocery_search_event.dart';
import 'grocery_search_notifier.dart';
import 'widget/grocery_search_grid_view.dart';
import 'widget/grocery_search_title.dart';

class GrocerySearchScreen extends StatefulWidget {
  final GrocerySearchArguments? arguments;

  const GrocerySearchScreen(this.arguments, {Key? key}) : super(key: key);

  @override
  _GrocerySearchScreenState createState() => _GrocerySearchScreenState();
}

class _GrocerySearchScreenState extends State<GrocerySearchScreen> {
  final TextEditingController searchTextEditingController =
      TextEditingController();
  late final GrocerySearchNotifier notifier;
  final eventController = StreamController<GrocerySearchEvent>();
  String appTitle = '';

  @override
  void initState() {
    super.initState();
    notifier = get<GrocerySearchNotifier>(param1: context, param2: widget.arguments);
    notifier.init(eventController);

    if (widget.arguments != null) {
      if (widget.arguments!.isBestSelling == true) {
        appTitle = 'Best Selling';
      } else if (widget.arguments!.isExclusive == true) {
        appTitle = 'Exclusive Offer';
      } else if (widget.arguments!.categoryId == 1) {
        appTitle = 'Fresh Fruits & Vegetable';
      } else if (widget.arguments!.categoryId == 2) {
        appTitle = 'Cooking Oil & Ghee';
      } else if (widget.arguments!.categoryId == 3) {
        appTitle = 'Meat & Fish';
      } else if (widget.arguments!.categoryId == 4) {
        appTitle = 'Bakery & Snacks';
      } else if (widget.arguments!.categoryId == 5) {
        appTitle = 'Dairy & Eggs';
      } else if (widget.arguments!.categoryId == 6) {
        appTitle = 'Beverages';
      }
    } else {
      appTitle = 'Groceries';
    }
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
        title: GrocerySearchTitle(title: appTitle),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SearchTextField(
            controller: searchTextEditingController,
            hintText: 'Search for grocery',
            onPressed: () {
              if (searchTextEditingController.text.isNotEmpty) {
                searchTextEditingController.clear();
                eventController.add(ClearSearchQueryEvent());
              }
            },
            onChanged: (String searchQuery) {
              eventController.add(SearchGroceryEvent(searchQuery));
            },
          ),
          GrocerySearchGridView(groceriesListenable: notifier),
        ],
      ),
    );
  }
}
