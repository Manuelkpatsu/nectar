import 'package:flutter/material.dart';
import 'custom_tile.dart';

class Help extends CustomTile {
  const Help({Key? key, VoidCallback? onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          title: 'Help',
          icon: Icons.help_outline,
        );
}
