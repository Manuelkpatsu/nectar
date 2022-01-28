import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class FavoriteTitle extends StatelessWidget {
  const FavoriteTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Favorite',
      style: bigStyle.copyWith(
        fontSize: 20,
      ),
    );
  }
}
