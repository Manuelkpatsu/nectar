import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.search_outlined,
      size: 20,
      color: AppColor.iconColor,
    );
  }
}
