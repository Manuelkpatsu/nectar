import 'package:flutter/material.dart';
import 'package:nectar/screen/store/cart/cart_tile.dart';
import 'package:nectar/screen/widget/app_divider.dart';
import 'package:nectar/theme/app_color.dart';

class CartListView extends StatelessWidget {
  const CartListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const CartTile();
        },
        separatorBuilder: (context, index) => const AppDivider(
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: AppColor.textFieldBorderColor,
        ),
      ),
    );
  }
}
