import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:tuple/tuple.dart';

import 'banner_slider.dart';

class HomeBanner extends StatelessWidget {
  final ValueListenable<Tuple2<int, List<Widget>>> bannerListenable;
  final void Function(int, CarouselPageChangedReason)? onPageChanged;

  const HomeBanner({
    Key? key,
    required this.bannerListenable,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 115,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColor.greyBackgroundColor),
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/banner-mask.png',
            ),
            fit: BoxFit.cover,
          )),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/banner_bg.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          BannerSlider(
            bannerListenable: bannerListenable,
            onPageChanged: onPageChanged,
          ),
        ],
      ),
    );
  }
}
