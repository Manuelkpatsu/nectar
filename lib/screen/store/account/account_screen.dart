import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

import '../../../locator.dart';
import 'account_notifier.dart';
import 'account_listenable.dart';
import 'widget/about.dart';
import 'widget/app_notifications.dart';
import 'widget/delivery_address.dart';
import 'widget/details.dart';
import 'widget/help.dart';
import 'widget/logout_button.dart';
import 'widget/orders.dart';
import 'widget/payment_methods.dart';
import 'widget/profile_image.dart';
import 'widget/profile_name_email.dart';
import 'widget/promo_code.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({ Key? key }) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late final AccountNotifier notifier;

  @override
  void initState() {
    super.initState();
    notifier = get<AccountNotifier>(param1: context);
    notifier.init();
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
        toolbarHeight: 90,
        elevation: 0.5,
        title: Row(
          children: [
            ProfileImage(imageListenable: notifier.photo),
            const SizedBox(width: 10),
            ProfileNameEmail(
              nameListenable: notifier.fullName,
              emailListenable: notifier.email,
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: ListTile.divideTiles(
                color: AppColor.textFieldBorderColor,
                context: context,
                tiles: [
                  Orders(onPressed: () {}),
                  Details(onPressed: () {}),
                  DeliveryAddress(onPressed: () {}),
                  PaymentMethods(onPressed: () {}),
                  PromoCode(onPressed: () {}),
                  AppNotifications(onPressed: () {}),
                  Help(onPressed: () {}),
                  About(onPressed: () {}),
                ]
              ).toList(),
            ),
          ),
          LogoutButton(onPressed: () {}),
        ],
      ),
    );
  }
}
