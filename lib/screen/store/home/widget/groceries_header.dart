import 'package:flutter/material.dart';

import 'header.dart';

class GroceriesHeader extends Header {
  const GroceriesHeader({Key? key, VoidCallback? onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          heading: 'Groceries',
        );
}
