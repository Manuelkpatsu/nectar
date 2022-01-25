import 'package:flutter/material.dart';
import 'package:nectar/screen/store/search/grocery_search/grocery_search_arguments.dart';

import 'search/grocery_search/grocery_search_screen.dart';

abstract class StoreFlowCoordinator {
  /// Navigates to GrocerySearchScreen
  ///
  /// [id] category id for searching groceries
  void goToGrocerySearchScreen(int id);
}

class MyStoreFlowCoordinator implements StoreFlowCoordinator {
  final BuildContext _context;

  MyStoreFlowCoordinator(this._context);

  @override
  void goToGrocerySearchScreen(int id) {
    final grocerySearchArgument = GrocerySearchArguments(id);

    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => GrocerySearchScreen(grocerySearchArgument),
      ),
    );
  }
}
