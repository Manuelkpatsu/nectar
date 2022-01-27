import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

class FavoriteButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const FavoriteButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.favorite_border_outlined,
        color: AppColor.mainGreyTextColor,
      ),
      splashRadius: 20,
    );
  }
}
