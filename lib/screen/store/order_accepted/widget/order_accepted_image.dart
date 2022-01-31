import 'package:flutter/material.dart';

class OrderAccpetedImage extends StatelessWidget {
  const OrderAccpetedImage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/order-successful.png',
      height: 240,
      width: 270,
      fit: BoxFit.cover,
    );
  }
}
