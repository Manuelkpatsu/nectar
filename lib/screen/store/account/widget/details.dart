import 'package:flutter/material.dart';
import 'custom_tile.dart';

class Details extends CustomTile {
  const Details({Key? key, VoidCallback? onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          title: 'My Details',
          icon: Icons.contact_mail_outlined
        );
}
