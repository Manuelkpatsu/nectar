import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class CartTitle extends StatelessWidget {
  const CartTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Cart',
      style: bigStyle.copyWith(
        fontSize: 20,
      ),
    );
  }
}
