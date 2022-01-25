import 'package:flutter/material.dart';

import 'banner_content.dart';

class BannerContentOne extends BannerContent {
  const BannerContentOne({Key? key})
      : super(
          key: key,
          image: 'assets/images/banner/banner-img-1.png',
          title: 'Fresh Vegetables',
          subTitle: 'Get Up To 40% OFF',
        );
}
