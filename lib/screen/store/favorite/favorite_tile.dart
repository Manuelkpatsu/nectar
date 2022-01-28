import 'package:flutter/material.dart';
import 'package:nectar/screen/store/favorite/widget/favorite_item_name.dart';
import 'package:nectar/screen/store/favorite/widget/favorite_item_per_price.dart';
import 'package:nectar/screen/store/favorite/widget/favorite_item_price.dart';
import 'package:nectar/theme/app_color.dart';

class FavoriteTile extends StatelessWidget {
  const FavoriteTile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            Image.asset(
              'assets/images/groceries/sprite-can.png',
              width: 65,
              height: 55,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      FavoriteItemName(name: 'Sprite Can'),
                      SizedBox(height: 5),
                      FavoriteItemPerPrice(perPrice: '325ml')
                    ],
                  ),
                  Row(
                    children: const [
                      FavoriteItemPrice(price: 1.50),
                      SizedBox(width: 10),
                      Icon(
                        Icons.chevron_right,
                        color: AppColor.mainTextColor,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
