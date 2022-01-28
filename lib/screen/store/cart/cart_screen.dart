import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_divider.dart';
import 'package:nectar/theme/app_color.dart';

import 'widget/cart_list_view.dart';
import 'widget/cart_title.dart';
import 'widget/go_to_checkout_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CartTitle(),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: Column(
        children: [
          const CartListView(),
          const AppDivider(color: AppColor.textFieldBorderColor),
          const SizedBox(height: 20),
          GoToCheckoutButton(onPressed: () {}, total: 48.64,),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
