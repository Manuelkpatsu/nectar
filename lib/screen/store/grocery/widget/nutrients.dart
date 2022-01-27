import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class Nutrients extends StatelessWidget {
  final String nutrient;
  final VoidCallback? onTap;

  const Nutrients({ Key? key, required this.nutrient, required this.onTap, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        'Nutrients',
        style: normalStyle.copyWith(
          color: AppColor.mainTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: AppColor.greyBackgroundColor,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Text(
              nutrient,
              style: smallStyle.copyWith(
                fontSize: 12,
                color: AppColor.mainGreyTextColor,
              ),
            ),
          ),
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
