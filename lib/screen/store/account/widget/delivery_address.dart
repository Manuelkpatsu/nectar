import 'package:flutter/material.dart';
import 'custom_tile.dart';

class DeliveryAddress extends CustomTile {
  const DeliveryAddress({Key? key, VoidCallback? onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          title: 'Delivery Address',
          icon: Icons.location_on_outlined,
        );
}
