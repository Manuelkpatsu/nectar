import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

import 'carousel_content.dart';

class ThumbnailCarousel extends StatelessWidget {
  final List<String> images;
  final void Function(int, CarouselPageChangedReason)? onPageChanged;
  final ValueListenable<int> imageIndexListenable;

  const ThumbnailCarousel({
    Key? key,
    required this.images,
    required this.onPageChanged,
    required this.imageIndexListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColor.greyBackgroundColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(
                height: double.infinity,
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) => onPageChanged!(index, reason)),
            itemBuilder: (context, index, realIndex) {
              String image = images[index];

              return CarouselContent(image: image);
            },
          ),
          Positioned(
            bottom: 7,
            right: 0,
            left: 0,
            child: ValueListenableBuilder<int>(
              valueListenable: imageIndexListenable,
              builder: (context, index, child) {
                return DotsIndicator(
                  dotsCount: images.length,
                  position: index.toDouble(),
                  decorator: DotsDecorator(
                    size: const Size.square(3),
                    activeColor: AppColor.primaryColor,
                    color: AppColor.textColor,
                    activeSize: const Size(15, 3),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
