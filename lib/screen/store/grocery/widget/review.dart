import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

import 'star_rating.dart';

class Review extends StatelessWidget {
  final double rating;
  final VoidCallback? onTap;

  const Review({
    Key? key,
    required this.onTap,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        'Review',
        style: normalStyle.copyWith(
          color: AppColor.mainTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          StarRating(rating: rating),
          const SizedBox(width: 10),
          const Icon(
            Icons.chevron_right,
            color: AppColor.mainTextColor,
          )
        ],
      ),
    );
  }
}
