import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class Header extends StatelessWidget {
  final VoidCallback? onPressed;
  final String heading;

  const Header({
    Key? key,
    required this.onPressed,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: bigStyle.copyWith(fontSize: 24),
          ),
          InkWell(
            onTap: onPressed,
            child: Text(
              'See all',
              style: normalStyle.copyWith(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
