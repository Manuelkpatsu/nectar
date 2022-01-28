import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty-basket.png',
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
          Text(
            'No Groceries',
            style: mediumStyle.copyWith(color: AppColor.mainTextColor),
          )
        ],
      ),
    );
  }
}
