import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

import 'add_to_cart_button.dart';
import 'grocery_image.dart';
import 'grocery_name.dart';
import 'grocery_per_price.dart';
import 'grocery_price.dart';

class GroceryItem extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? addToCart;
  final String image;
  final String name;
  final String perPrice;
  final double price;

  const GroceryItem({
    Key? key,
    required this.onTap,
    required this.addToCart,
    required this.image,
    required this.name,
    required this.perPrice,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: 175,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          border: Border.all(width: 1, color: AppColor.textFieldBorderColor)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GroceryImage(image: image),
            const SizedBox(height: 20),
            GroceryName(name: name),
            GroceryPerPrice(perPrice: perPrice),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GroceryPrice(price: price),
                AddToCartButton(onPressed: addToCart),
              ],
            )
          ],
        ),
      ),
    );
  }
}
