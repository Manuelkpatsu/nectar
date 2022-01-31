import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class OrderAcceptedText extends StatelessWidget {
  const OrderAcceptedText({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Your order has been accepted',
      textAlign: TextAlign.center,
      style: bigStyle.copyWith(
        fontSize: 28,
      ),
    );
  }
}

