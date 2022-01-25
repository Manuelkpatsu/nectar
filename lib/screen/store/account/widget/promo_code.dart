import 'package:flutter/material.dart';
import 'custom_tile.dart';

class PromoCode extends CustomTile {
  const PromoCode({Key? key, VoidCallback? onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          title: 'Promo Code',
          icon: Icons.local_offer_outlined,
        );
}
