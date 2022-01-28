import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

import 'widget/cart_item_name.dart';
import 'widget/cart_item_per_price.dart';
import 'widget/cart_item_total_amount.dart';
import 'widget/increment_decrement_button.dart';

class CartTile extends StatelessWidget {
  const CartTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        child: Row(
          children: [
            Image.asset(
              'assets/images/groceries/red-apple.png',
              width: 70,
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            CartItemName(name: 'Red Bell Pepper'),
                            SizedBox(height: 5),
                            CartItemPerPrice(perPrice: '10g'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.close),
                        color: AppColor.checkBoxStrokeColor,
                        splashRadius: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IncrementDecrementButton(
                            onPressed: () {},
                            icon: Icons.remove,
                            color: AppColor.primaryColor,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            4.toString(),
                            style: normalStyle.copyWith(
                              color: AppColor.mainTextColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 20),
                          IncrementDecrementButton(
                            onPressed: () {},
                            icon: Icons.add,
                            color: AppColor.primaryColor,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      const CartItemTotalAmount(totalAmount: 9.96),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
