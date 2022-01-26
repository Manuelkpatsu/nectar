import 'package:flutter/material.dart';

import 'header.dart';

class BestSellingHeader extends Header {
  const BestSellingHeader({Key? key, VoidCallback? onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          heading: 'Best Selling',
        );
}
