import 'package:flutter/material.dart';
import 'package:nectar/screen/widget/app_divider.dart';
import 'package:nectar/theme/app_color.dart';

import 'widget/add_all_to_cart_button.dart';
import 'widget/favorite_list_view.dart';
import 'widget/favorite_title.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({ Key? key }) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FavoriteTitle(),
        centerTitle: true,
        elevation: 0.3,
      ),
      body: Column(
        children: [
          const FavoriteListView(),
          const AppDivider(color: AppColor.textFieldBorderColor),
          const SizedBox(height: 20),
          AddAllToCartButton(onPressed: () {}),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
