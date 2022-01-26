import 'package:flutter/material.dart';
import 'package:nectar/screen/store/search/grocery_search/grocery_search_arguments.dart';

import 'grocery/grocery_argument.dart';
import 'grocery/grocery_screen.dart';
import 'search/grocery_search/grocery_search_screen.dart';

abstract class StoreFlowCoordinator {
  /// Navigates to GrocerySearchScreen
  ///
  /// [id] category id for searching groceries
  void goToGrocerySearchScreen(
    int? id,
    bool? isExclusive,
    bool? isBestSelling,
  );

  /// Navigates to GroceryScreen
  ///
  /// [id] category id for searching groceries
  void goToGroceryScreen(int id);

  /// Navigates to GrocerySearchScreen
  ///
  /// no param is passed since it fetches all groceries
  void goToViewAllGrocerySearchScreen();
}

class MyStoreFlowCoordinator implements StoreFlowCoordinator {
  final BuildContext _context;

  MyStoreFlowCoordinator(this._context);

  @override
  void goToGrocerySearchScreen(
    int? id,
    bool? isExclusive,
    bool? isBestSelling,
  ) {
    final grocerySearchArgument =
        GrocerySearchArguments(id, isExclusive, isBestSelling);

    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => GrocerySearchScreen(grocerySearchArgument),
      ),
    );
  }

  @override
  void goToGroceryScreen(int id) {
    final groceryArgument = GroceryArgument(id);

    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => GroceryScreen(groceryArgument),
      ),
    );
  }

  @override
  void goToViewAllGrocerySearchScreen() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => const GrocerySearchScreen(null),
      ),
    );
  }
}
