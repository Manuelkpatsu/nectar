import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:tuple/tuple.dart';

class BannerSlider extends StatelessWidget {
  final ValueListenable<Tuple2<int, List<Widget>>> bannerListenable;
  final void Function(int, CarouselPageChangedReason)? onPageChanged;

  const BannerSlider({Key? key, required this.bannerListenable, required this.onPageChanged,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Tuple2<int, List<Widget>>>(
      valueListenable: bannerListenable,
      builder: (context, tuple, child) {
        return Stack(
          children: [
            CarouselSlider.builder(
              itemCount: tuple.item2.length,
              options: CarouselOptions(
                height: double.infinity,
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) => onPageChanged!(index, reason)
              ),
              itemBuilder: (context, index, realIndex) {
                return tuple.item2[index];
              },
            ),
            Positioned(
              bottom: 7,
              right: 0,
              left: 0,
              child: DotsIndicator(
                dotsCount: tuple.item2.length,
                position: tuple.item1.toDouble(),
                decorator: DotsDecorator(
                  size: const Size.square(5),
                  activeColor: AppColor.primaryColor,
                  color: AppColor.textColor,
                  activeSize: const Size(16, 5),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
