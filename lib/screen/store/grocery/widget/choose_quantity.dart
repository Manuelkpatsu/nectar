import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class ChooseQuantity extends StatelessWidget {
  final VoidCallback? increment;
  final VoidCallback? decrement;
  final ValueListenable<int?> quantityListenable;
  final int groceryQuantity;

  const ChooseQuantity({
    Key? key,
    required this.decrement,
    required this.increment,
    required this.quantityListenable,
    required this.groceryQuantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: quantityListenable,
      builder: (context, quantity, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: quantity == 1 ? null : decrement,
              icon: Icon(
                Icons.remove,
                color: quantity == 1
                    ? AppColor.mainGreyTextColor
                    : AppColor.primaryColor,
              ),
              splashRadius: 20,
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                border: Border.all(
                  color: AppColor.textFieldBorderColor,
                  width: 1,
                ),
              ),
              child: Text(
                '$quantity',
                textAlign: TextAlign.center,
                style: mediumStyle.copyWith(
                  color: AppColor.mainTextColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: quantity == groceryQuantity ? null : increment,
              icon: Icon(
                Icons.add,
                color: quantity == groceryQuantity
                    ? AppColor.mainGreyTextColor
                    : AppColor.primaryColor,
              ),
              splashRadius: 20,
            ),
          ],
        );
      },
    );
  }
}
