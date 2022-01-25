import 'package:flutter/material.dart';
import 'custom_tile.dart';

class PaymentMethods extends CustomTile {
  const PaymentMethods({Key? key, VoidCallback? onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          title: 'Payment Methods',
          icon: Icons.payment_outlined,
        );
}
