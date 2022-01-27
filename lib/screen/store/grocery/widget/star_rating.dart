import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;

  const StarRating({
    Key? key,
    this.starCount = 5,
    this.rating = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        return buildStar(context, index);
      }),
    );
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;

    if (index >= rating) {
      icon = const Icon(Icons.star_border, color: AppColor.mainGreyTextColor);
    } else if (index > rating - 1 && index < rating) {
      icon = const Icon(Icons.star_half, color: AppColor.redColor);
    } else {
      icon = const Icon(Icons.star, color: AppColor.redColor);
    }
    return icon;
  }
}
