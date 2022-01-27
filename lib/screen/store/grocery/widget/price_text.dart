import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class PriceText extends StatelessWidget {
  final double price;

  const PriceText({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${price.toStringAsFixed(2)}',
      style: bigStyle.copyWith(fontSize: 24),
    );
  }
}
