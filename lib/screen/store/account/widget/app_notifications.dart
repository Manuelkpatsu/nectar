import 'package:flutter/material.dart';
import 'custom_tile.dart';

class AppNotifications extends CustomTile {
  const AppNotifications({Key? key, VoidCallback? onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          title: 'Notifications',
          icon: Icons.notifications_outlined,
        );
}
