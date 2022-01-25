import 'package:flutter/material.dart';
import 'custom_tile.dart';

class About extends CustomTile {
  const About({Key? key, VoidCallback? onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          title: 'About',
          icon: Icons.error_outline,
        );
}
