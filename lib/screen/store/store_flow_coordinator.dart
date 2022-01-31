import 'package:flutter/material.dart';
import 'package:nectar/screen/auth/sign_in_info/sign_in_info_screen.dart';
import 'package:nectar/screen/store/order_accepted/order_accepted_screen.dart';
import 'package:nectar/screen/store/search/grocery_search/grocery_search_arguments.dart';

import 'cart/widget/checkout_sheet.dart';
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

  /// Navigates to SignInInfoScreen
  void goToSignInInfoScreen();

  /// Shows [SelectCheckoutOptionsSheet]
  Future<CheckoutOption?> showSelectCheckoutOptionsSheet();

  /// Navigates to SignInInfoScreen
  void goToOrderAcceptedScreen();
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

  @override
  void goToSignInInfoScreen() {
    Navigator.pushAndRemoveUntil(
      _context,
      MaterialPageRoute(
        builder: (_) => const SignInInfoScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Future<CheckoutOption?> showSelectCheckoutOptionsSheet() {
    return showModalBottomSheet<CheckoutOption>(
      context: _context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (_) => CheckoutSheet(
        onCloseCheckout: () => Navigator.pop(_context),
        onDeliveryTap: () => Navigator.pop(_context, CheckoutOption.delivery),
        onConditionsTap: () => Navigator.pop(_context, CheckoutOption.conditions),
        onPaymentTap: () => Navigator.pop(_context, CheckoutOption.payment),
        onPlaceOrderTap: () => Navigator.pop(_context, CheckoutOption.order),
        onPromoCodeTap: () => Navigator.pop(_context, CheckoutOption.promo),
        onTermsTap: () => Navigator.pop(_context, CheckoutOption.terms),
      ),
    );
  }

  @override
  void goToOrderAcceptedScreen() {
    Navigator.push(
      _context,
      MaterialPageRoute(
        builder: (_) => const OrderAcceptedScreen(),
      ),
    );
  }
}

/// Specifies the checkout option type to be picked.
enum CheckoutOption {
  delivery,
  payment,
  promo,
  order,
  terms,
  conditions,
}
