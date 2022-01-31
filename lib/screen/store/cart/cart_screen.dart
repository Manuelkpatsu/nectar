import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_divider.dart';
import 'package:nectar/theme/app_color.dart';

import '../../../locator.dart';
import 'cart_event.dart';
import 'cart_notifier.dart';
import 'widget/cart_list_view.dart';
import 'widget/cart_title.dart';
import 'widget/go_to_checkout_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final eventController = StreamController<CartEvent>();
  late final CartNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = get<CartNotifier>(param1: context);
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
      appBar: AppBar(
        title: const CartTitle(),
        centerTitle: true,
        elevation: 0.3,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const CartListView(),
          const AppDivider(color: AppColor.textFieldBorderColor),
          const SizedBox(height: 20),
          GoToCheckoutButton(
            onPressed: () {
              eventController.add(CheckoutEvent());
            },
            total: 39.84,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
