import 'package:flutter/material.dart';
import 'custom_tile.dart';

class Orders extends CustomTile {
  const Orders({Key? key, VoidCallback? onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          title: 'Orders',
          icon: Icons.local_mall_outlined,
        );
}
