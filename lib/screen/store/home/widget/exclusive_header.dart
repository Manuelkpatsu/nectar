import 'package:flutter/material.dart';

import 'header.dart';

class ExclusiveHeader extends Header {
  const ExclusiveHeader({Key? key, VoidCallback? onPressed})
      : super(
          key: key,
          onPressed: onPressed,
          heading: 'Exclusive Offer',
        );
}
